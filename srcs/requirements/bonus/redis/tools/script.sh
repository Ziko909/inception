#!/bin/sh

# script for build the env of the service redis

# auther Ziko909

install_packages() {
        echo "update packages"
        apk update \
        && apk upgrade 
        echo "install redis"
        apk add redis
}

config() {
        mkdir  -p /var/log/redis
        sed -i "s/bind 127.0.0.1 -::1/bind $REDIS_HOST/g" /etc/redis.conf
        echo "maxmemory $REDIS_MAX_MEMORY""mb" >> /etc/redis.conf
        echo "maxmemory-policy  allkeys-lru" >> /etc/redis.conf
        sed -i 's/loglevel notice/loglevel warning/g' /etc/redis.conf
        sed -i 's/logfile ""/logfile \/var\/log\/redis\/redis.log/g' /etc/redis.conf
        sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf
        sed -i "s/# requirepass foobared/requirepass $REDIS_PASSWORD/g" /etc/redis.conf
}

if [ $# -ne 1 ]
then
        1>&2 echo "Plaese Enter 1 argument";
        exit 7;
fi

if	[ "$1" == "packages" ]
then
	install_packages ;
elif	[ "$1" == "config" ]
then
	config ;
else
	1>&2 echo "invalid argument";
	exit 22;
fi