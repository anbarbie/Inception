FROM	debian:buster

RUN	apt update && apt install -y mariadb_server

ENTRYPOINT["./conf/entrypoint.sh"]
EXPOSE	3306
