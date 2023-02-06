
build :
	docker build -t mariadb:v1 .;

removec :
	docker rm -f $(shell docker ps -a --quiet);

removei :
	docker image rm $(shell docker image ls --quiet);

run :
	docker run -it --name mariadb mariadb:v1;
