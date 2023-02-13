# the base image
FROM	alpine:3.16.4

# auther
MAINTAINER	Ziko909

# description about the image
LABEL	description="this image contains a fastcgi (php-fpm) for running php scripts with in the server side"

# the port of the service (php-fpm)
EXPOSE	9000

# copy the script to bin path 
COPY	tools/script.sh /bin

# copy the config files into the image fs
COPY	conf/* /etc/php7/

# install packages and set the config
RUN	script.sh packages \
	&& script.sh config

# install wordpress (if not found) && run the php-fpm from script
ENTRYPOINT	["script.sh", "run"]
