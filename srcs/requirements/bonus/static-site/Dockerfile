# the base image
FROM    alpine:3.16.4

# auther
MAINTAINER	Ziko909

# description about the image
LABEL   description="A lightweight and high-performance web server."

# the port of the service (static-website)
EXPOSE  80

# script to build the env of the service
COPY    tools/script.sh /bin

# copy config files to the image fs
COPY    conf/*  /etc/nginx/

# copy the html page
COPY    tools/index.html /var/www/html/inception-site/index.html

# install packages
RUN script.sh packages

# mv server config to conf.d folder
RUN script.sh config

# run the server
ENTRYPOINT  ["nginx"]
