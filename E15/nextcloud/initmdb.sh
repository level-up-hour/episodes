#!/bin/sh
# Adapted from script mysql_secure_installation by René Hartman (mail@hac-maarssen.nl)

config=".my.cnf.$$"
command=".mysql.$$"

trap "interrupt" 1 2 3 6 15

rootpass=""
echo_n=
echo_c=
basedir=
defaults_file=
defaults_extra_file=
no_defaults=

parse_arg()
{
  echo "$1" | sed -e 's/^[^=]*=//'
}

parse_arguments()
{
  pick_args=
  if test "$1" = PICK-ARGS-FROM-ARGV
  then
    pick_args=1
    shift
  fi

  for arg
  do
    case "$arg" in
      --basedir=*) basedir=`parse_arg "$arg"` ;;
      --defaults-file=*) defaults_file="$arg" ;;
      --defaults-extra-file=*) defaults_extra_file="$arg" ;;
      --no-defaults) no_defaults="$arg" ;;
      *)
        if test -n "$pick_args"
        then
          args="$args $arg"
        fi
        ;;
    esac
  done
}

find_in_basedir()
{
  return_dir=0
  found=0
  case "$1" in
    --dir)
      return_dir=1; shift
      ;;
  esac

  file=$1; shift

  for dir in "$@"
  do
    if test -f "$basedir/$dir/$file"
    then
      found=1
      if test $return_dir -eq 1
      then
        echo "$basedir/$dir"
      else
        echo "$basedir/$dir/$file"
      fi
      break
    fi
  done

  if test $found -eq 0
  then
      # Test if command is in PATH
      $file --no-defaults --version > /dev/null 2>&1
      status=$?
      if test $status -eq 0
      then
        echo $file
      fi
  fi
}

cannot_find_file()
{
  echo
  echo "FATAL ERROR: Could not find $1"

  shift
  if test $# -ne 0
  then
    echo
    echo "The following directories were searched:"
    echo
    for dir in "$@"
    do
      echo "    $dir"
    done
  fi
}

parse_arguments PICK-ARGS-FROM-ARGV "$@"

if test -n "$basedir"
then
  print_defaults=`find_in_basedir my_print_defaults bin extra`
  echo "print: $print_defaults"
  if test -z "$print_defaults"
  then
    cannot_find_file my_print_defaults $basedir/bin $basedir/extra
    exit 1
  fi
  mysql_command=`find_in_basedir mysql bin`
  if test -z "$mysql_command"
  then
    cannot_find_file mysql $basedir/bin
    exit 1
  fi
else
  print_defaults="/usr/bin/my_print_defaults"
  mysql_command="/usr/bin/mysql"
fi

if test ! -x "$print_defaults"
then
  cannot_find_file "$print_defaults"
  exit 1
fi

if test ! -x "$mysql_command"
then
  cannot_find_file "$mysql_command"
  exit 1
fi

parse_arguments `$print_defaults $defaults_file $defaults_extra_file $no_defaults client client-server client-mariadb`
parse_arguments PICK-ARGS-FROM-ARGV "$@"

set_echo_compat() {
    case `echo "testing\c"`,`echo -n testing` in
	*c*,-n*) echo_n=   echo_c=     ;;
	*c*,*)   echo_n=-n echo_c=     ;;
	*)       echo_n=   echo_c='\c' ;;
    esac
}

validate_reply () {
    ret=0
    if [ -z "$1" ]; then
	reply=y
	return $ret
    fi
    case $1 in
        y|Y|yes|Yes|YES) reply=y ;;
        n|N|no|No|NO)    reply=n ;;
        *) ret=1 ;;
    esac
    return $ret
}

prepare() {
    touch $config $command
    chmod 600 $config $command
}

do_query() {
    echo "$1" >$command
    #sed 's,^,> ,' < $command  # Debugging
    $mysql_command --defaults-file=$config $defaults_extra_file $no_defaults $args <$command
    return $?
}

basic_single_escape () {
    echo "$1" | sed 's/\(['"'"'\]\)/\\\1/g'
}

make_config() {
    echo "# mysql_secure_installation config file" >$config
    echo "[mysql]" >>$config
    echo "user=root" >>$config
    esc_pass=`basic_single_escape "$rootpass"`
    echo "password='$esc_pass'" >>$config
    #sed 's,^,> ,' < $config  # Debugging

    if test -n "$defaults_file"
    then
        dfile=`parse_arg "$defaults_file"`
        cat "$dfile" >>$config
    fi
}

get_root_password() {
    status=1
    while [ $status -eq 1 ]; do
	stty -echo
	echo $echo_n "Enter current password for root (enter for none): $echo_c"
	read password
	echo
	stty echo
	if [ "x$password" = "x" ]; then
	    hadpass=0
	else
	    hadpass=1
	fi
	rootpass=$password
	make_config
	do_query ""
	status=$?
    done
    echo "OK, successfully used password, moving on..."
    echo
}

set_root_password() {
    stty -echo
    echo $echo_n "New password: $echo_c"
    read password1
    echo
    echo $echo_n "Re-enter new password: $echo_c"
    read password2
    echo
    stty echo

    if [ "$password1" != "$password2" ]; then
	echo "Sorry, passwords do not match."
	echo
	return 1
    fi

    if [ "$password1" = "" ]; then
	echo "Sorry, you can't use an empty password here."
	echo
	return 1
    fi

    esc_pass=`basic_single_escape "$password1"`
    do_query "UPDATE mysql.user SET Password=PASSWORD('$esc_pass') WHERE User='root';"
    if [ $? -eq 0 ]; then
	echo "Password updated successfully!"
	echo "Reloading privilege tables.."
	reload_privilege_tables
	if [ $? -eq 1 ]; then
		clean_and_exit
	fi
	echo
	rootpass=$password1
	make_config
    else
	echo "Password update failed!"
	clean_and_exit
    fi

    return 0
}

remove_anonymous_users() {
    do_query "DELETE FROM mysql.user WHERE User='';"
    if [ $? -eq 0 ]; then
	echo " ... Success!"
    else
	echo " ... Failed!"
	clean_and_exit
    fi

    return 0
}

remove_remote_root() {
    do_query "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    if [ $? -eq 0 ]; then
	echo " ... Success!"
    else
	echo " ... Failed!"
    fi
}

remove_test_database() {
    echo " - Dropping test database..."
    do_query "DROP DATABASE IF EXISTS test;"
    if [ $? -eq 0 ]; then
	echo " ... Success!"
    else
	echo " ... Failed!  Not critical, keep moving..."
    fi

    echo " - Removing privileges on test database..."
    do_query "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"
    if [ $? -eq 0 ]; then
	echo " ... Success!"
    else
	echo " ... Failed!  Not critical, keep moving..."
    fi

    return 0
}

reload_privilege_tables() {
    do_query "FLUSH PRIVILEGES;"
    if [ $? -eq 0 ]; then
	echo " ... Success!"
	return 0
    else
	echo " ... Failed!"
	return 1
    fi
}

interrupt() {
    echo
    echo "Aborting!"
    echo
    cleanup
    stty echo
    exit 1
}

cleanup() {
    echo "Cleaning up..."
    rm -f $config $command
}

# Remove the files before exiting.
clean_and_exit() {
	cleanup
	exit 1
}

# The actual script starts here

prepare
set_echo_compat
get_root_password

#
# Set the root password
#

echo "Setting the root password ensures that nobody can log into the MariaDB"
echo "root user without the proper authorisation."
echo

while true ; do
    if [ $hadpass -eq 0 ]; then
	echo $echo_n "Set root password? [Y/n] $echo_c"
    else
	echo "You already have a root password set, so you can safely answer 'n'."
	echo
	echo $echo_n "Change the root password? [Y/n] $echo_c"
    fi
    read reply
    validate_reply $reply && break
done

if [ "$reply" = "n" ]; then
    echo " ... skipping."
else
    status=1
    while [ $status -eq 1 ]; do
	set_root_password
	status=$?
    done
fi

#
# Remove anonymous users
#

echo "Removing anonymous users"
remove_anonymous_users
echo

#
# Disallow remote root login
#

echo "Removing remote root access"
remove_remote_root
echo

#
# Remove test database
#

echo "Removing the test database and access to it"
remove_test_database
echo

#
# Reload privilege tables
#

echo "Reloading the privilege tables"
reload_privilege_tables
echo

cleanup

echo
echo "All done!  If you've completed all of the above steps, your MariaDB"
echo "installation should now be secure."
echo
echo "Thanks for using MariaDB!"
