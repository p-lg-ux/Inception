#!/bin/bash

#mariadb-install-db --user=mysql --datadir=/var/lib/mysql
service mariadb start;

#echo "finished mariadb start"

sleep 1;

var=$(mysqladmin ping -u ${SQL_USER} -p${SQL_PASSWORD} 2>&1 | grep error | wc -l)

if [ $var -eq 1 ] ; then

	mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
	mariadb -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

	mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

	mariadb -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

fi

mysqladmin -u root --password=${SQL_ROOT_PASSWORD} shutdown
#mysqladmin -u root shutdown

sleep 1;

exec mysqld_safe
