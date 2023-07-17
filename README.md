# Inception

This project involves setting up a Docker infrastructure with multiple services. Here is an overview of the project structure:

## Directory Structure
```
.
├── Makefile
└── srcs
    ├── docker-compose.yml
    ├── .env
    └── requirements
        ├── bonus
        ├── mariadb
        │   ├── conf
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── tools
        ├── nginx
        │   ├── conf
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── tools
        └── wordpress
            ├── conf
            ├── Dockerfile
            ├── .dockerignore
            └── tools
```

## Description
This project sets up a Docker infrastructure using Docker Compose. It consists of the following services:

1. **mariadb**: This service sets up a MariaDB container. It uses the Dockerfile located at `srcs/requirements/mariadb/Dockerfile` and includes configuration files from `srcs/requirements/mariadb/conf`. The container is named `mariadb` and is connected to the `inception` network. The MariaDB data is stored in the `mariadb` volume.

2. **nginx**: This service sets up an NGINX container. It uses the Dockerfile located at `srcs/requirements/nginx/Dockerfile` and includes configuration files from `srcs/requirements/nginx/conf`. The container is named `nginx` and is connected to the `inception` network. It mounts the `wordpress` volume to the `/var/www/html` directory.

3. **wordpress**: This service sets up a WordPress container. It uses the Dockerfile located at `srcs/requirements/wordpress/Dockerfile` and includes configuration files from `srcs/requirements/wordpress/conf`. The container is named `wordpress` and is connected to the `inception` network. It depends on the `mariadb` service for database access. The WordPress website files are stored in the `wordpress` volume.

## Usage
To set up the Docker infrastructure, run the following command:
```
make all
```

This command will build the Docker images and start the containers according to the configuration specified in the `docker-compose.yml` file.

To clean up the infrastructure and remove the containers and volumes, run:
```
make clean
```

Make sure to replace `login` with your actual login name when configuring the domain name.

Please refer to the provided Dockerfiles and configuration files for further details on the setup of each service.

Note: Make sure you have Docker and Docker Compose installed on your system before running the commands.

Enjoy your Docker infrastructure setup!
