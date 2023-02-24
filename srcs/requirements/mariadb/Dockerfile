FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server
COPY	./conf/entrypoint.sh /usr/bin/
RUN	chmod +x /usr/bin/entrypoint.sh
RUN	chmod 775 /var/lib/mysql
COPY	./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf

ENTRYPOINT ["entrypoint.sh"]
EXPOSE	3306
