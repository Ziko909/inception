# auther Ziko909
# make file to automating the use of the project

DEFAULT=\e[0m
RED=\e[31m
GREEN=\e[32m
BROWN=\e[33m
Volumes=/home/zaabou/data/*
NAME=inception

all: $(NAME)

$(NAME): create_data_folders up

create_data_folders:
	@mkdir -p /home/zaabou/data/wordpress
	@mkdir -p /home/zaabou/data/mariadb

clean: down

fclean: down
	@echo "${GREEN} Removing Data Folders ${DEFAULT}"
	@sudo rm -rf ${Volumes}

re: fclean all

build:
	@echo "${GREEN} Building the images of the application ${DEFAULT}";
	@docker compose -f docker-compose.yaml build --parallel
	@echo "${GREEN} Done ✅ ${DEFAULT}"

create:
	@echo "${GREEN} Creating the containers of the service ${DEFAULT}"
	@docker compose -f docker-compose.yaml create --force-recreate
	@rm
	@echo "${GREEN} Done ✅ ${DEFAULT}"

down:
	@echo "${GREEN} Remove the project ${DEFAULT}"
	@docker compose -f docker-compose.yaml down --rmi all -v
	@echo "${GREEN} Done ✅ ${DEFAULT}"

images:
	@echo "${GREEN} show the images of the project ${DEFAULT}"
	@docker compose -f docker-compose.yaml images
	@echo "${GREEN} Done ✅ ${DEFAULT}"

ps:
	@echo "${GREEN} show the containers ${DEFAULT}"
	@docker compose -f docker-compose.yaml ps
	@echo "${GREEN} Done ✅ ${DEFAULT}"

restart:
	@echo "${GREEN} restart the containers ${DEFAULT}"
	@docker compose -f docker-compose.yaml restart
	@echo "${GREEN} Done ✅ ${DEFAULT}"

start:
	@echo "${GREEN} start containers ${DEFAULT}"
	@docker compose -f docker-compose.yaml start
	@echo "${GREEN} Done ✅ ${DEFAULT}"

stop:
	@echo "${GREEN} stop containers ${DEFAULT}"
	@docker compose -f docker-compose.yaml stop
	@echo "${GREEN} Done ✅ ${DEFAULT}"

up:
	@echo "${GREEN} run the service ${DEFAULT}"
	@docker compose -f docker-compose.yaml up --force-recreate
	@echo "${GREEN} Done ✅ ${DEFAULT}"
