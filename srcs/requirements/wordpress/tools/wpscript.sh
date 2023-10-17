#!/bin/bash

cd /var/www/wordpress

if ! [ -f ./wp-config.php ]
then
	sudo -u www-data wp config create --dbname=${SQL_DATABASE} \
					  --dbuser=${SQL_USER} \
					  --dbpass=${SQL_PASSWORD} \
					  --dbhost=${SQL_HOST} \
					  --path='/var/www/wordpress'
					  
	sudo -u www-data wp core install --url=http://${DOMAIN_NAME} \
					 --title=${SITE_TITLE} \
					 --admin_user=${ADMIN_USER} \
					 --admin_password=${ADMIN_PASSWORD} \
					 --admin_email=${ADMIN_EMAIL}
	
	sudo -u www-data wp user create ${USER1_LOGIN} ${USER1_EMAIL} \
					--user_pass=${USER1_PASSWORD}
					
	sudo -u www-data wp cache flush
					
fi

if ! [ -d /run/php ]
then
	mkdir /run/php
fi

exec /usr/sbin/php-fpm7.3 -F


