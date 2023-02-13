# the base image
FROM	alpine:3.16.4
# auther
MAINTAINER	Ziko909

# description about the image
LABEL	description="this image contains a mysql server"

# the port of service (mysql server)
EXPOSE	3306

# declare variables for the build stage
ARG	MYSQL_ROOT_PASSWORD
ARG	DB_NAME
ARG	MYSQL_USER
ARG	MYSQL_PASSWORD

# copy the script for building env
COPY	tools/script.sh /bin

# copy the config file of mariadb
COPY	conf/mariadb.cnf /etc/my.cnf

# install packages && setup the mysql server
RUN	script.sh packages \
	&& script.sh setup

# create wordpress database (if does not exist) && run mysql server
ENTRYPOINT	["script.sh", "run"]
