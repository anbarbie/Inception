FROM	debian:buster

RUN	apt-get update && apt-get install -y mariadb-server
COPY	./conf/entrypoint.sh /usr/local/bin/
COPY	./conf/my.cnf etc/mysql/my.cnf

#ENTRYPOINT ["entrypoint.sh"]
EXPOSE	3306
