PS:=$(shell sudo docker ps -aq)
IMAGES:=$(shell sudo docker images -aq)

up:
	sudo docker compose -f ./srcs/docker-compose.yml up

upd:	
	sudo docker compose -f ./srcs/docker-compose.yml up -d

tuto:
	sudo docker compose -f ./srcs/tutodocker-compose.yml up

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

mariadb:
	sudo docker build -t mariadb ./srcs/requirements/mariadb

nginx:
	sudo docker build -t nginx ./srcs/requirements/nginx

wordpress:
	sudo docker build -t wordpress ./srcs/requirements/wordpress

re: fclean prune up

clean:
ifdef PS
	@sudo docker rm $(PS)
endif

fclean: clean
ifdef IMAGES
	@sudo docker rmi $(IMAGES)
endif

echo:
ifdef PS
	@echo $(PS)
else
	@echo "No PS"
endif
ifdef IMAGES
	@echo $(IMAGES)
else
	@echo "No images"
endif

prune:
	@sudo docker system prune -f
