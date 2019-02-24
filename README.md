# Developer Assorted Container Services

Bunch of Docker Compose files suitable for starting services to support developments

## Database

| Command                | Service              | Description                  |
|------------------------|----------------------|------------------------------|
| `make ds-mysql-down`   | MySQL & phpMyAdmin   | Stop the services            |
| `make ds-mysql-up`     | MySQL & phpMyAdmin   | Stop then start the services |
| `make ds-mariadb-up`   | MariaDB & phpMyAdmin | Stop the services            |
| `make ds-mariadb-down` | MariaDB & phpMyAdmin | Stop then start the services |

## Utilities

| Commands         | Service | Description                      |
|------------------|---------|----------------------------------|
| `make all`       | None    | Display all Make targets         |
| `make clear-all` | None    | Stop then delete ALL containers  |