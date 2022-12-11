#!/bin/sh

#mysql_install_db --defaults-file=/etc/mysql/my.cnf --user=mysql

service mysql start

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABSE;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

exec mysqld -u root
