PS:=$(shell sudo docker ps -aq)
IMAGES:=$(shell sudo docker images -aq)

up:
	docker compose ./srcs/. up

down:
	docker compose ./srcs/. down

mariadb:
	sudo docker build -t mariadb ./srcs/requirements/mariadb

nginx:
	sudo docker build -t nginx ./srcs/requirements/nginx

wordpress:
	sudo docker build -t wordpress ./src/requirements/wordpress

clean:
ifdef PS
	@sudo docker rm $(PS)
endif

fclean: clean
ifdef IMAGES
	@sudo docker rmi $(IMAGES)
endif

prune:
	@sudo docker system prune -f
