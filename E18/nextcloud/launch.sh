#!/bin/bash

# we need to do this post image creation so
# we can bind mount correctly
# using shopt to get those pesky .htaccess files
# gotta make it idempotent
if [ ! -f /opt/app-root/src/config/config.php ]
then
    shopt -s dotglob && cp -vR /tmp/nextcloud/* ./
fi

# Run script uses standard ways to configure the PHP application
# and execs httpd -D FOREGROUND at the end
# See more in <version>/s2i/bin/run in this repository.
# Shortly what the run script does: The httpd daemon and php needs to be
# configured, so this script prepares the configuration based on the container
# parameters (e.g. available memory) and puts the configuration files into
# the approriate places.
# This can obviously be done differently, and in that case, the final CMD
# should be set to "CMD httpd -D FOREGROUND" instead.
/usr/libexec/s2i/run
