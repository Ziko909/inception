# the base image
FROM	alpine:latest

# copy the script for building env
COPY	tools/script.sh /bin

COPY	conf/mariadb.cnf /etc/my.cnf

ENV	MYSQL_ROOT_PASSWORD="!@#$$11@@#$%" DBNAME="wordpressdb" MYSQL_USER="test" MYSQL_PASSWORD="125464563"

# install packages
RUN	script.sh packages \
	&& script.sh setup

ENTRYPOINT	["script.sh", "run"]
