FROM	debian:buster

RUN	apt-get update && apt-get install -y \
					php-fpm \
					php-mysql \
					wget \
					mariadb-client
RUN	mkdir -p /var/www/html
RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www/html
RUN	cd /var/www/html && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chmod 755 /var/www/html
RUN	chown -R root:root /var/www/html
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp
COPY	./wp_config.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/wp_config.sh

RUN	echo "listen=9000" >> /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ["wp_config.sh"]
EXPOSE	9000
