FROM centos:centos6

MAINTAINER Tetsuo Aoyagi <aoyagi@opentone.co.jp>

RUN yum install vim-enhanced -y
RUN yum install httpd -y

# PHP5.4
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

RUN yum install php --enablerepo=remi -y
RUN yum install mod_php --enablerepo=remi -y
RUN yum install php-pgsql --enablerepo=remi -y
RUN yum install php-mbstring --enablerepo=remi -y
RUN yum install php-mcrypt --enablerepo=remi -y

# Apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/httpd
ENV APACHE_LOCK_DIR /var/lock/httpd
ENV APACHE_PID_FILE /var/run/httpdc.pid

# Add Apache/PHP configuration
ADD conf/apache-config.conf /etc/httpd/conf.d/vhosts.conf
ADD conf/php-config.ini /etc/php.d

CMD /usr/sbin/apachectl -D FOREGROUND

EXPOSE 80
