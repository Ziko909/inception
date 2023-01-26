#the base image
FROM	alpine:latest

# auther
MAINTAINER	Ziko909

#description about the image
LABEL	description="this is a simple image that contain a nginx webserv in linux alpine"

# update the apk package manager of alpine and install nginx
RUN	apk update \
	&& apk upgrade \
	&& apk add nginx \
	&& mkdir /etc/nginx/conf.d

# copy the config files for nginx
COPY    conf/*  /etc/nginx/

#mv the vserver1 config to conf.d folder
RUN     mv /etc/nginx/vserver1.conf /etc/nginx/conf.d && ls /etc/nginx/conf.d

#copy the test html page
COPY    html/* /ziko/web/

# run the nginx with PID 1
ENTRYPOINT	["nginx"]

