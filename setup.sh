#!/bin/bash

HOST_VOLUME_ROOT=/c/Users/
APACHE_DOC_ROOT=/var/www/html

DOCKER_COMPOSE_CONF=./docker-compose.yml
APACHE_CONF=./containers/web/conf/apache-config.conf

echo " --------------------------------------------------"
echo "  DOCKER-CENTOS6-PHP5.4-PGSQL setup tool"
echo " "
echo "  Please specify your prefer paths."
echo " --------------------------------------------------"

echo -n " Path to mount on Docker host. (mounted to /var/www/html) [$HOST_VOLUME_ROOT]: "
read volume_root
if [ "$volume_root" == "" ]; then
    volume_root=$HOST_VOLUME_ROOT
fi

echo -n " Path for Apache's document root.[$APACHE_DOC_ROOT]: "
read doc_root
if [ "$doc_root" == "" ]; then
    doc_root=$APACHE_DOC_ROOT
fi

echo $volume_root
echo $doc_root

cat ${DOCKER_COMPOSE_CONF}.tmpl | sed -e "s#%%HOST_VOLUME_ROOT%%#$volume_root#g" > ${DOCKER_COMPOSE_CONF}
cat ${APACHE_CONF}.tmpl | sed -e "s#%%DOC_ROOT%%#$doc_root#g" > ${APACHE_CONF}
