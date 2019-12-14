.DEFAULT_GOAL := help

## GENERAL ##
OWNER 						= api
SERVICE_NAME 				= node-colegio
VERSION         			= v1
PROVIDER					= ronaldgcr
DOCKER_NETWORK				?= --network api_reserva 
## DEV ##
TAG_DEV						= 0.0.1
TAG_TEST					= test
TAG_MYSQL 					= mysql
MYSQL_USER					?= root
MYSQL_ROOT_PASSWORD			?= 1234
USER_ID  					?= $(shell id -u)
GROUP_ID 					?= $(shell id -g)

## DEPLOY ##
ENV 						?= dev
BUILD_NUMBER 				?= 000001
BUILD_TIMESTAMP 			?= 20181005
DEPLOY_REGION 				?= eu-west-1
ACCOUNT_ID					?= 929226109038
DESIRED_COUNT 				?= 1
MIN_SCALING					?= 1
MAX_SCALING					?= 2
MEMORY_SIZE 				?= 512
CONTAINER_PORT 				?= 80
INFRA_BUCKET 				?= infraestructura.dev

## RESULT_VARS ##
PROJECT_NAME			    = $(OWNER)-$(ENV)-$(SERVICE_NAME)
IMAGE_DEPLOY			    = $(PROVIDER)/$(PROJECT_NAME):$(TAG_DEV)
IMAGE_TEST			    		= $(PROVIDER)/$(PROJECT_NAME):$(TAG_TEST)

## VARIABLES FOR LOCAL BALANCER, 'SPRING CONFIG OR ENV VARS' ##
VIRTUAL_HOST				= $(PROJECT_NAME)/$(VERSION)

## DEFAULT ##
NETWORD					    ?= orbis-training-$(PROJECT_NAME)
PATH_CORE					?= $(PWD)/core

build: ## construccion de la imagen: make build IMAGE_DEPLOY=IMAGE_TEST
	docker build -f docker/node/Dockerfile -t $(IMAGE_DEPLOY) docker/node/;

build-test: ## construccion de la imagen: make build IMAGE_DEPLOY=IMAGE_TEST
	docker build -f docker/node/Dockerfile -t $(IMAGE_TEST) docker/node/;

install: ## install de paquetes
	make tast EXECUTE="install";
	sudo chmod -R 777 app/*;

tast: ## tast: make tast EXECUTE="add bcrypt"
	docker run -it -v "$(PWD)/app:/app" -w "/app" $(IMAGE_DEPLOY) yarn $(EXECUTE)

ssh: ## ssh: make ssh
	docker run -it -v "$(PWD)/app:/app" -w "/app" $(IMAGE_DEPLOY) bash

test-e2e: ## Run the end to end Tests
	echo $(VIRTUAL_HOST);
	@IMAGE_DEPLOY=$(IMAGE_DEPLOY) \
	PROJECT_NAME=$(PROJECT_NAME) \
	VIRTUAL_HOST=$(VIRTUAL_HOST) \
	IMAGE_TEST=$(IMAGE_TEST) \
	docker-compose -f docker-compose-test.yml run  yarn test

mysql: ## construir mysql
	docker run -p 3306:3306 --name $(TAG_MYSQL) $(DOCKER_NETWORK) -v $(PWD)/docker/mysql/sql:/docker-entrypoint-initdb.d -e MYSQL_ROOT_PASSWORD=$(MYSQL_ROOT_PASSWORD) -e MYSQL_USER=$(MYSQL_USER) -e MYSQL_DATABASE=reservation -d mysql:5.5;

start: ## inicializar proyecto: make login
	docker run -it -p 3000:3000 --name $(PROJECT_NAME)  -v "$(PWD)/app:/app" -w "/app"  $(IMAGE_DEPLOY) yarn start

migration: ## inicializar proyecto: make migration
	docker run -it -v $(NETWORK) "$(PWD)/app:/app" -w "/app" $(IMAGE_DEPLOY) yarn migration

run-migration: ## inicializar proyecto: make migration
	make mysql
	docker run -it -p 3000:3000 --name $(PROJECT_NAME) $(DOCKER_NETWORK)  -v "$(PWD)/app:/app" -w "/app"  $(IMAGE_DEPLOY) yarn run-migration

up: ## inicialiar mysql y applicacion
	echo $(VIRTUAL_HOST);
	@IMAGE_DEPLOY=$(IMAGE_DEPLOY) \
	PROJECT_NAME=$(PROJECT_NAME) \
	VIRTUAL_HOST=$(VIRTUAL_HOST) \
	docker-compose -p $(PROJECT_NAME) up

test: ## inicialiar mysql y applicacion
	make mysql;
	docker run -it -p 3000:3000 --name $(PROJECT_NAME)  -v "$(PWD)/app:/app" -w "/app"  $(IMAGE_DEPLOY) yarn test:unit

login: ## login de docker: make login
	@docker login

push: ## Subir imagen al dockerhub: make push
	@make login
	@docker push $(IMAGE_DEPLOY)

help: ## ayuda: make help
	@printf "\033[31m%-16s %-59s %s\033[0m\n" "Target" "Help" "Usage"; \
	printf "\033[31m%-16s %-59s %s\033[0m\n" "------" "----" "-----"; \
	grep -hE '^\S+:.*## .*$$' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' | sort | awk 'BEGIN {FS = ":"}; {printf "\033[32m%-16s\033[0m %-58s \033[34m%s\033[0m\n", $$1, $$2, $$3}'
