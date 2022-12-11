FROM	debian:buster

RUN	apt-get update && apt-get install -y \
					php-fpm \
					php-mysql \
					wget
RUN	mkdir -p /var/www/html/wordpress
RUN	echo "listen=9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN	service php7.3-fpm start

EXPOSE	9000
ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F"]
