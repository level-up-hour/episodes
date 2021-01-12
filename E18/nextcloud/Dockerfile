FROM registry.access.redhat.com/ubi8/php-74 

USER root
RUN yum -y install php-gd php-xml \
    php-mbstring php-intl php-pecl-apcu php-mysqlnd \
    php-opcache php-json php-zip \
    iproute procps less && \
    yum clean all

USER default
# Add application sources
# for some reason this is being added as root
ADD ./nextcloud-20.0.2.tar.xz /tmp/
ADD launch.sh /opt/launch.sh
USER root

#for debugging
RUN ls -l /tmp/nextcloud || :
RUN ls -l /opt/app-root/src || :

RUN chown -R default /tmp/nextcloud
RUN chown default /opt/launch.sh
RUN chmod a+x /opt/launch.sh
#back to real user
USER default
CMD /opt/launch.sh
