FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/db_create.sh /etc/mysql/db_create.sh
RUN chmod +x /etc/mysql/db_create.sh

COPY ./tools/export.sh /etc/mysql/export.sh
RUN chmod +x /etc/mysql/export.sh

EXPOSE 3306

#CMD ["sh", "/etc/mysql/db_create.sh"]

