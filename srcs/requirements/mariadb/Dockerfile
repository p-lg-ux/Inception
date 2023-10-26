FROM debian:bullseye

#Install mariadb
RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

#Provide configuration for mariadb use
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#Make directory for volume and change rights
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/

#Copy script for database service configuration
COPY ./tools/db_create.sh /etc/mysql/db_create.sh
RUN chmod +x /etc/mysql/db_create.sh


CMD ["sh", "/etc/mysql/db_create.sh"]

