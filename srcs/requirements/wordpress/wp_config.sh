#!/bin/sh

sleep 10
wp config create --path=/var/www/html/wordpress --allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=mariadb:3306

wp core install --allow-root --path=/var/www/html/wordpress \
	--url=https://localhost/wordpress \
	--title=Inception \
	--admin_user=master \
	--admin_password=master \
	--admin_email=master@of.wp \
	--skip-email	

wp user create --allow-root --path=/var/www/html/wordpress antbarbi antbarbi@of.wp --user_pass=antbarbi

mkdir -p /run/php
exec /usr/sbin/php-fpm7.3 -F
