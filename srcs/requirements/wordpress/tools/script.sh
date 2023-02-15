#!/bin/sh

# script for running php-fmp with wordpress

# auther Ziko909
# date 02/02/23

WP_PATH=/var/www/html/wordpress

install_packages() {
	echo "change the apk version for php7"
	sed -i "s/v3.16/v3.15/g" /etc/apk/repositories;
	echo "update and upgrade apk"
	apk update && apk upgrade
	echo "installing the php packages"
	apk add php7 php7-common php7-session php7-iconv \
	php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-fpm \
	php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
	php7-ldap php7-ctype php7-dom php7-simplexml php7-phar mysql-client
	echo "installing wp-cli"
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /bin/wp-cli
}

config(){
	echo "mv the pool config file into php-fpm.d"
	mv /etc/php7/wordpress_pool.conf /etc/php7/php-fpm.d
	echo "creating a log directory"
	mkdir -p /var/log/php-fpm/
}

run(){
	if [ ! -d $WP_PATH ]
	then
		wp-cli core download --path=$WP_PATH --allow-root \
		&& wp-cli config create --path=$WP_PATH --dbname=$DB_NAME --dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD --dbhost="mariadb" --allow-root \
		&& wp-cli core install --path=$WP_PATH --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL \
		--skip-email --allow-root \
		&& wp-cli user create --path=$WP_PATH --allow-root $WP_USER_LOGIN $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PASSWORD \
		--first_name=$WP_USER_FIRST_NAME --last_name=$WP_USER_LAST_NAME
	fi
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
elif	[ "$1" == "run" ]
then
	run;
	exec php-fpm7;
else
	1>&2 echo "invalid argument";
	exit 22;
fi
