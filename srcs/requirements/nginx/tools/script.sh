#!/bin/sh

# script for running nginx with TLS

# auther Ziko909
# date  27/01/23

install_packages() {
        echo "updating apk packages";
        apk update \
        && apk upgrade
        echo "installing nginx";
        apk add nginx;
        echo "creating conf.d folder";
        mkdir -p /etc/nginx/conf.d;
        echo "installing openssl";
        apk add openssl;
}

config() {
        echo "mv vserver config file to conf.d";
        mv www.zaabou.42.fr.conf conf.d;
}

generate_ssl_certificate() {
        echo "generating the certificate ";
	cd /etc/ssl/;
	openssl	req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private/zaabou.42.fr.key -out certs/zaabou.42.fr.crt \
	-subj "/C=Ma/CN=zaabou.42.fr" 2>&-;
}

if [ $# -ne 1 ]
then
       	1>&2 echo "Plaese Enter 1 argument";
        exit 7;
fi

if [ "$1" == "packages" ]
then
        install_packages ;
elif [ "$1" == "config" ]
then
        config ;
elif [ "$1" == "ssl" ]
then
        generate_ssl_certificate ;
else
	1>&2 echo "invalid argument";
	exit 22;
fi
