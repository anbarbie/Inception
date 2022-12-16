#!/bin/sh

#mysql_install_db --user=mysql --ldata=var/lib/mysql > /dev/null

service mysql start

echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

exec mysqld -u root
