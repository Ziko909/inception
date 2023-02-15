#!/bin/sh

# script for running php-fmp to execute adminer

# auther Ziko909

install_packages() {
	echo "update and upgrade apk"
	apk update && apk upgrade
	echo "installing the php packages"
	apk add php81 php81-fpm php81-mysqli php81-session
	echo "downloading the adminer script"
	wget -q https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php \
	&& mkdir -p /var/www/html/ && mv adminer-4.8.1-mysql.php /var/www/html/adminer.php \
	&& chmod +x /var/www/html/adminer.php
}

config(){
	echo "mv the pool config file into php-fpm.d"
	mv /etc/php81/adminer_pool.conf /etc/php81/php-fpm.d
	echo "creating a log directory"
	mkdir -p /var/log/php-fpm/
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
