# script : initcont.sh
# author : nlhacm (support@hac-maarssen.nl)
# purpose: initialize nextcloud container after first start
#          - set correct web and database ownerships
#          - start the mariadb service
#          - secure the mariadb database & set mariadb root password
         
#!/bin/bash
# must be root user in /root dir
if [ $(id -u) -ne 0 ] || [ $(dirname $(readlink -f $0)) != /root ] ; then
  echo "ERRO: not root; EXITING"
fi

echo "INFO: showing current settings"
ls -l /var/www/html/nextcloud /var/lib/mysql

if [ ! -f /var/www/html/nextcloud/index.html ] ; then
  echo "ERRO: website directory is empty; exiting"
  exit
fi

if [ -d /var/lib/mysql/mysql ] ; then
  echo "INFO: initialisation already done, exiting"
  exit
else
  echo "INFO: changing nextcloud ownership to apache"
  chown -R apache: /var/www/html/nextcloud
  echo "INFO: changing mysql ownership to mysql"
  chown mysql:  /var/lib/mysql
  echo "INFO: (re)starting failed mariadb service"
  systemctl start mariadb
  echo "INFO: securing the database"
  /root/initmdb.sh
fi

echo
echo "INFO: all done"
