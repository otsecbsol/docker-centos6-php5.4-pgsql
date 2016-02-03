FROM centos:centos6

MAINTAINER Tetsuo Aoyagi <aoyagi@opentone.co.jp>

# VIM
RUN yum install vim-enhanced -y

# APACHE
RUN yum install httpd -y

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

RUN yum install php --enablerepo=remi -y
# RUN source /opt/rh/php54/enable
# RUN source /etc/profile
RUN yum install mod_php --enablerepo=remi -y
RUN yum install php-pgsql --enablerepo=remi -y
RUN yum install php-mbstring --enablerepo=remi -y
RUN yum install php-mcrypt --enablerepo=remi -y

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
# RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /opt/rh/php54/root/etc/php.ini
# RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /opt/rh/php54/root/etc/php.ini

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/httpd
ENV APACHE_LOCK_DIR /var/lock/httpd
ENV APACHE_PID_FILE /var/run/httpdc.pid

# # Copy site into place.
# ADD www /var/www/site
# RUN chmod 755 /var/www

# Add apache configuration
ADD conf/apache-config.conf /etc/httpd/conf.d/vhosts.conf
ADD conf/php-config.ini /etc/php.d

# By default, simply start apache.
CMD /usr/sbin/apachectl -D FOREGROUND

EXPOSE 80
