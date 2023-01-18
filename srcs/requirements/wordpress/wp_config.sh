#!/bin/sh

sleep 10
wp config create --path=/var/www/html/wordpress --allow-root \
	--dbname=$MYSQL_DATABASE \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=$WP_DB_HOST

wp core install --allow-root --path=/var/www/html/wordpress \
	--url=https://localhost/wordpress \
	--title=Inception \
	--admin_user=$WP_ADMIN_NAME \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email	

wp user create --allow-root --path=/var/www/html/wordpress $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD

mkdir -p /run/php
exec /usr/sbin/php-fpm7.3 -F
