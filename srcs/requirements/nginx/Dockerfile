# the base image
FROM	alpine:3.16.4

# auther
MAINTAINER	Ziko909

# description about the image
LABEL	description="this is a simple image that contains a nginx webserv in linux alpine with custom config"

# the port of the service (nginx)
EXPOSE	443

# add script to binaries in the image fs
COPY	tools/script.sh /bin

# update apk and install packages and generating ssl certificate
RUN	script.sh packages && script.sh ssl

# change the working directory
WORKDIR	/etc/nginx/

# copy the config files for nginx
COPY    conf/*  ./

# mv vservers config file into conf.d folder
RUN	script.sh config

# run as entrypoint in the container
ENTRYPOINT	["nginx"]

