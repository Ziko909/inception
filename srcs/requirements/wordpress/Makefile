
build :
	@docker build -t wordpress:v1 .;

removec :
	@docker rm -f $(shell docker ps -a --quiet);

removei :
	@docker image rm $(shell docker image ls --quiet);

run :
	@docker run -it --name wordpress wordpress:v1;
git :
	@git add ${filename};
	@git commit -m "${msg}";
