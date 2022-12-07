#!/bin/sh

#mysql_install_db

service mysql start

echo "CREATE USER IF NOT EXISTS 'antbarbi'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "CREATE DATABASE IF NOT EXISTS db1;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'antbarbi'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

exec mysqld -u root
