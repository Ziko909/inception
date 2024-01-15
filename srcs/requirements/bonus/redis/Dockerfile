# the base image
FROM    alpine:3.16.4

# auther
MAINTAINER  Ziko909

# description about the image
LABEL   description="This image contains a Redis server to act as a cache for the WordPress website."

# the port of service (redis)
EXPOSE  6379

# define variables for the build stage
ARG     REDIS_HOST
ARG     REDIS_PASSWORD
ARG     REDIS_MAX_MEMORY

# copy the script to build env for the service (redis)
COPY    tools/script.sh /bin

# install packages and setup the config
RUN     script.sh packages \
        && script.sh config

# run redis
ENTRYPOINT  ["redis-server", "/etc/redis.conf"]
