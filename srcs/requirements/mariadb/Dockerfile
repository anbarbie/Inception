FROM	debian:buster

RUN	apt-get update && apt-get install -y mariadb-server
COPY	./conf/entrypoint.sh /usr/bin/
RUN	chmod +x /usr/bin/entrypoint.sh
COPY	./conf/my.cnf /etc/mysql/my.cnf

ENTRYPOINT ["entrypoint.sh"]
EXPOSE	3306
