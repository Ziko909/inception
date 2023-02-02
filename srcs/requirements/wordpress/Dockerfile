# the base image
FROM	alpine:latest

# auther
MAINTAINER	Ziko909

# description about the image
LABEL	description="this image contains a fastcgi (php-fpm) for running php scripts with in the server side"

# copy the script to bin path 
COPY	tools/script.sh /bin

# copy the config files into the image fs
COPY	conf/* /etc/php81/

# install packages and set the config
RUN	script.sh packages \
	&& script.sh config

# run the php-fpm as pid 1 in the container
ENTRYPOINT	["php-fpm81"]
