SRC_DIR = srcs/docker-compose.yml

all:
	docker-compose -f $(SRC_DIR) up --build

# clean-imgs:
# 	docker rmi -f $$(docker image ls)

clean-containers-volumes:
	docker system prune -af

fclean: clean-containers-volumes