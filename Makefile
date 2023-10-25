all:
	mkdir -p ${HOME}/data/database
	mkdir -p ${HOME}/data/wp_website
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up

clean:
	docker compose -f ./srcs/docker-compose.yml stop
	#docker network rm -f inception
	

fclean:	clean
	sudo rm -rf ${HOME}/data/database/*
	sudo rm -rf ${HOME}/data/wp_website/*
	docker system prune -af

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

re: fclean all

.PHONY : all clean fclean re logs
