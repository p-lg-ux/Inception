#!/bin/bash

service mariadb start;

sleep 1;

mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mariadb -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mariadb -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

mysqladmin -u root --password=${SQL_ROOT_PASSWORD} shutdown
#mysqladmin -u root shutdown

sleep 1;

exec mysqld_safe
