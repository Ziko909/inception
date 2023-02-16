#!/bin/sh

# auther Ziko909

install_packages(){
            echo "updating apk"
            apk update \
            &&  apk upgrade
            echo "install nginx"
            apk add nginx
            echo "creating conf.d folder";
            mkdir -p /etc/nginx/conf.d;
}

config() {
        echo "mv vserver config file to conf.d";
        cd /etc/nginx
        mv inception-site.conf  conf.d;
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
else
	1>&2 echo "invalid argument";
	exit 22;
fi