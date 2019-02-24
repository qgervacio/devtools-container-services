.PHONY: 
	all
	clear-all
	ds-mysql-up 
	ds-mysql-down
	ds-mariadb-up 
	ds-mariadb-down

# MySQL + phpmyadmin
DS_MYSQL_PORT=3306
DS_MYSQL_PORTPMD=8080
DS_MYSQL_USERNAME=root
DS_MYSQL_PASSWORD=root
DS_MYSQL_IMG=mysql:5.7
DS_MYSQL_IMGPMD=phpmyadmin/phpmyadmin

# MariaDB(re-use above) + phpmyadmin(re-use above)
DS_MARIADB_IMG=mariadb
DS_MARIADB_PORT=3307
DS_MARIADB_PORTPMD=8181

all:
	@echo "Target Summary:"
	@echo "all ------------- Display this summary"
	@echo "clear-all ------- Note: Stop and remove ALL containers"
	@echo "ds-mysql-up ----- Start mysql with phpmyadmin"
	@echo "ds-mysql-down --- Stop and remove mysql and phpmyadmin"
	@echo "ds-mariadb-up --- Start mariadb with phpmyadmin"
	@echo "ds-mariadb-down - Stop and remove mariadb and phpmyadmin"

ds-mysql-down:
	@DS_MYSQL_PORT="${DS_MYSQL_PORT}" \
	 DS_MYSQL_PORTPMD="${DS_MYSQL_PORTPMD}" \
	 DS_MYSQL_USERNAME="${DS_MYSQL_USERNAME}" \
	 DS_MYSQL_PASSWORD="${DS_MYSQL_PASSWORD}" \
	 DS_MYSQL_IMG="${DS_MYSQL_IMG}" \
	 DS_MYSQL_IMGPMD="${DS_MYSQL_IMGPMD}" \
	 docker-compose stop mysql mysql-phpmyadmin

ds-mysql-up:
	-make ds-mysql-down
	@DS_MYSQL_PORT="${DS_MYSQL_PORT}" \
	 DS_MYSQL_PORTPMD="${DS_MYSQL_PORTPMD}" \
	 DS_MYSQL_USERNAME="${DS_MYSQL_USERNAME}" \
	 DS_MYSQL_PASSWORD="${DS_MYSQL_PASSWORD}" \
	 DS_MYSQL_IMG="${DS_MYSQL_IMG}" \
	 DS_MYSQL_IMGPMD="${DS_MYSQL_IMGPMD}" \
	 docker-compose up -d mysql mysql-phpmyadmin
	@echo "Login to MySQL phpmyadmin using ${DS_MYSQL_USERNAME}/${DS_MYSQL_PASSWORD} at http://localhost:${DS_MYSQL_PORTPMD}"

ds-mariadb-down:
	@DS_MYSQL_PORT="${DS_MARIADB_PORT}" \
	 DS_MYSQL_PORTPMD="${DS_MARIADB_PORTPMD}" \
	 DS_MYSQL_USERNAME="${DS_MYSQL_USERNAME}" \
	 DS_MYSQL_PASSWORD="${DS_MYSQL_PASSWORD}" \
	 DS_MARIADB_IMG="${DS_MARIADB_IMG}" \
	 DS_MYSQL_IMGPMD="${DS_MYSQL_IMGPMD}" \
	 docker-compose stop mariadb mariadb-phpmyadmin

ds-mariadb-up:
	-make ds-mariadb-down
	@DS_MYSQL_PORT="${DS_MARIADB_PORT}" \
	 DS_MYSQL_PORTPMD="${DS_MARIADB_PORTPMD}" \
	 DS_MYSQL_USERNAME="${DS_MYSQL_USERNAME}" \
	 DS_MYSQL_PASSWORD="${DS_MYSQL_PASSWORD}" \
	 DS_MARIADB_IMG="${DS_MARIADB_IMG}" \
	 DS_MYSQL_IMGPMD="${DS_MYSQL_IMGPMD}" \
	 docker-compose up -d mariadb mariadb-phpmyadmin
	@echo "Login to MariaDB phpmyadmin using ${DS_MYSQL_USERNAME}/${DS_MYSQL_PASSWORD} at http://localhost:${DS_MARIADB_PORTPMD}"

# stop and delete all running containers
clear-all:
	-docker stop $$(docker ps -a -q)
	-docker rm $$(docker ps -a -q)