#!/bin/sh

# script for build the envirenement of the container

# auther Ziko909

setup(){
        echo "download cadvisor"
        wget -q https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 \
        && chmod +x cadvisor-v0.47.0-linux-amd64 \
        && mv cadvisor-v0.47.0-linux-amd64 /bin/cadvisor
}

if [ $# -ne 1 ]
then
       	1>&2 echo "Plaese Enter 1 argument";
        exit 7;
fi

if [ "$1" == "setup" ]
then
    setup ;
else
	1>&2 echo "invalid argument";
	exit 22;
fi

