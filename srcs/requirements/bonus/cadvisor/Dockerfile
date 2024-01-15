# the base image
FROM    alpine:3.16.4

# auther
MAINTAINER  Ziko909

# description about the image
LABEL   description="This image contains cAdvisor for monitoring containers."

# copy script to build env
COPY    tools/script.sh /bin/script.sh

# setup the env for the service (cadvisor)
RUN script.sh setup

# run the cadvisor
ENTRYPOINT  ["cadvisor"]
