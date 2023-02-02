#!/bin/sh

# script for running php-fmp with wordpress

# auther Ziko909
# date 02/02/23

install_packages() {
        echo "updating apk packages";
        apk update \
        && apk upgrade
        echo "installing php && php-fpm";
        apk add php81 \
	&& apk add php81-fpm
}

config(){
	echo "mv the pool config file into php-fpm.d"
	mv /etc/php81/p1.conf /etc/php81/php-fpm.d
	echo "creating a log directory"
	mkdir -p /var/log/php-fpm/
}

if [ $# -ne 1 ]
then
        1>&2 echo "Plaese Enter 1 argument";
        exit 7;
fi

if	[ $1 == "packages" ]
then
	install_packages ;
elif	[ $1 == "config" ]
then
	config ;
else
	1>&2 echo "invalid argument";
	exit 22;
fi
