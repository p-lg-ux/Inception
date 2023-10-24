
all:
	mkdir -p ${HOME}/data/database
	mkdir -p ${HOME}/data/wp-website
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up

clean:
	docker compose -f ./srcs/docker-compose.yml stop

fclean:	
	


.PHONY : all clean fclean re
