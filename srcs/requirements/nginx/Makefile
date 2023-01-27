
build :
	docker build -t nginx:v1 .;

removec :
	docker rm -f $(shell docker ps -a --quiet);

removei :
	docker image rm $(shell docker image ls --quiet);

run :
	docker run -itp 3000:443 --name nginx nginx:v1;
