#!/bin/sh
# script for running mariaDB

# auther Ziko909
# date  04/02/23

install_packages() {
        echo "updating apk packages";
        apk update \
        && apk upgrade
        echo "install mariadb and mariadb-client";
        apk add mariadb mariadb-client;
}

setup(){
	if  [ $1 == "build" ]
	then
		echo "settuping the mariadb"
		mkdir -p /var/log/mysqld;
		chown -Rf mysql:mysql /var/log/mysqld;
		mysql_install_db --user=mysql --base=/usr --datadir=/var/lib/mysql --skip-test-db >> /dev/null;
	elif [ $1 == "securing" ]
	then
		echo "securing the mariadb"
		mysqld_safe --user=mysql >> /dev/null &
		sleep 5;
		mysql --user=root -e "delete from mysql.user where User='';"
		mysql --user=root -e "delete from mysql.user where User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
		mysql --user=root -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';"
		mysql --user=root -p$MYSQL_ROOT_PASSWORD -e "flush privileges;"
		mysql --user=root -p$MYSQL_ROOT_PASSWORD -e "create database $DB_NAME";
		mysql -u root -p$MYSQL_ROOT_PASSWORD -e "create user '$MYSQL_USER'@'wordpress.inception' identified by '$MYSQL_PASSWORD';"
		mysql -u root -p$MYSQL_ROOT_PASSWORD -e "grant all privileges on $DB_NAME.* to '$MYSQL_USER'@'wordpress.inception';"
		mysql -u root -p$MYSQL_ROOT_PASSWORD -e "flush privileges;"
		kill -15 -1;
	fi
}

set_db(){
	if [ ! -d /var/lib/mysql/$DB_NAME ]
	then
		echo "creating database"
		mysqld_safe --user=mysql >> /dev/null &
		sleep 5;
		mysql -u root -p$MYSQL_ROOT_PASSWORD -e "create database $DB_NAME;";
		kill -15 -1;
		sleep 5;
	fi
}

if [ $# -ne 1 ]
then
	1>&2 echo "Plaese Enter 1 argument";
	exit 7;
fi

if [ $1 == "packages" ]
then
	install_packages
elif [ $1 == "config" ]
then
	config
elif [ $1 == "setup" ]
then
	setup build;
	setup securing;
elif [ $1 == "run" ]
then
	set_db ;
	exec mysqld_safe --user=mysql >> /dev/null;
else
	1>&2 echo "invalid argument";
	exit 22;
fi