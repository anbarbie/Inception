PS:=$(shell sudo docker ps -aq)
IMAGES:=$(shell sudo docker images -aq)
VOLUME:=$(shell sudo docker volume ls -q)

up:
	mkdir -p /home/antbarbi/data/mariadb
	mkdir -p /home/antbarbi/data/html
	sudo docker compose -f ./srcs/docker-compose.yml up -d

upe:	
	mkdir -p /home/antbarbi/data/mariadb
	mkdir -p /home/antbarbi/data/html
	sudo docker compose -f ./srcs/docker-compose.yml up

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

mariadb:
	sudo docker build -t mariadb ./srcs/requirements/mariadb

nginx:
	sudo docker build -t nginx ./srcs/requirements/nginx

wordpress:
	sudo docker build -t wordpress ./srcs/requirements/wordpress

re: clear up

clear: fclean prune
	sudo rm -rf /home/antbarbi/data/html;
	sudo rm -rf /home/antbarbi/data/mariadb;

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

volume:
ifdef VOLUME
	@sudo docker volume rm $(VOLUME)
else
	@echo "No volume"
endif

data:
	@sudo rm -rf /home/antbarbi/data
	@mkdir -p /home/antbarbi/data
