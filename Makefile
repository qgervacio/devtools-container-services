.PHONY: clear-all ds-mysql-up ds-mysql-down

ds-mysql-down:
	@docker-compose -f ds-mysql.dc.yaml down

ds-mysql-up:
	-make ds-mysql-down
	@docker-compose -f ds-mysql.dc.yaml up -d
	@echo "Login to phpmyadmin at http://localhost:8080"

# stop and delete all running containers
clear-all:
	-docker stop $$(docker ps -a -q)
	-docker rm $$(docker ps -a -q)