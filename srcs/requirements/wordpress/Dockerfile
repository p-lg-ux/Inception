FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade

#Install requirement
RUN apt-get install -y sudo
RUN apt-get install -y wget

#Install php
RUN apt-get install -y php7.4\
			php-fpm\
			php-mysql\
			mariadb-client
			
#Download wordpress
RUN wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www 
RUN cd /var/www \
	&& tar -xzf wordpress-6.2-fr_FR.tar.gz\
	&& rm wordpress-6.2-fr_FR.tar.gz

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*	
# RUN chown -R root:root /var/www/wordpress

#Download wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#Copy php config file from the host machine to the docker
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

#Copy script for wordpress installation and configuration
COPY ./tools/wpscript.sh ./wp-script.sh
RUN chmod +x ./wp-script.sh

CMD ["sh", "wp-script.sh"]

