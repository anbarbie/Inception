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

stop:
	sudo docker compose -f ./srcs/docker-compose.yml stop

restart:
	sudo docker compose -f ./srcs/docker-compose.yml restart

re: clear up

clear: fclean prune data

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
