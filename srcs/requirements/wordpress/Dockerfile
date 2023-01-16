FROM	debian:buster

RUN	apt-get update && apt-get install -y \
					php-fpm \
					php-mysql \
					wget \
					mariadb-client 
RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp
COPY	./wp_config.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/wp_config.sh

#RUN	mkdir -p /var/www/html/wordpress
RUN	echo "listen=9000" >> /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ["wp_config.sh"]
EXPOSE	9000
