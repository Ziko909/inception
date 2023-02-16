# the base image
FROM	alpine:3.16.4

# auther
MAINTAINER	Ziko909

# description about the image
LABEL	description="this image contains adminer web-based DBMS with php-fpm"

# the port of the fast-cgi
EXPOSE	9000

# Copy script to build env
COPY	tools/script.sh /bin

# copy config files of php-fpm
COPY	conf/*	/etc/php81/

# install packages and setup the config
RUN script.sh packages \
	&& script.sh config

# run the php-fpm
ENTRYPOINT	["php-fpm81"]
