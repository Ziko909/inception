#the base image
FROM	alpine:latest

# auther
MAINTAINER	Ziko909

#description about the image
LABEL	description="this is a simple image that contain a nginx webserv in linux alpine"

#add script to binaries to the image fs
COPY	tools/script.sh /bin

# update apk and install packages and f generate ssl certificate
RUN	script.sh packages && script.sh ssl

# change the working directory
WORKDIR	/etc/nginx/

# copy the config files for nginx
COPY    conf/*  ./

# mv vservers config files into conf.d folder
RUN	script.sh config

# copy the test html page
COPY    html/* /ziko/web/

# run the nginx with PID 1
ENTRYPOINT	["nginx"]

