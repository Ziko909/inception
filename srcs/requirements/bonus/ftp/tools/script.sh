#!/bin/bash
# script for build the env of the service (ftp)

# auther Ziko909

install_packages() {
        echo "update packages"
        apt update \
        && apt upgrade -y
        echo "installing ftp server"
        apt install vsftpd -y
}

config() {
        echo "setup the configuration"
        adduser --gecos --disabled-password $FTP_USER
        echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
        echo "$FTP_USER" >> /etc/vsftpd.userlist
        mkdir -p /var/run/vsftpd/empty
}

set_up() {
	if [ ! -d /home/$FTP_USER/upload ]
	then
		mkdir -p /home/$FTP_USER/upload
		chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/upload
		chmod -R 744 /home/$FTP_USER/upload
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
elif [ $1 == "run" ]
then
	set_up ;
	exec vsftpd;
else
	1>&2 echo "invalid argument";
	exit 22;
fi
