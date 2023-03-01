# the base image
FROM    debian:buster

# auther
MAINTAINER  Ziko909

# description about the image
LABEL   description="this image contains an ftp server point to wordpress files"

# the port to access the service (ftp)
EXPOSE  21

# define variables for the build stage
ARG FTP_USER
ARG FTP_PASSWORD

# copy script to build the env of the service (ftp)
COPY    tools/script.sh /bin

# install packages
RUN script.sh packages \
    && script.sh config

# copy the config file
COPY    conf/vsftpd.conf /etc/vsftpd.conf

# run the ftp server
ENTRYPOINT  ["script.sh", "run"]
