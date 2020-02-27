# hapless-horn

## Quick Start for Docker Compose

```bash

# Docker Images Requirement
docker-compose -p hapless-horn pull
docker-compose -p hapless-horn build

# Laravel Requirements
docker-compose -p hapless-horn run --rm php-apache bash
docker-compose -p hapless-horn run --rm php-apache composer install


# Startup 
docker-compose -p hapless-horn up -d
docker-compose -p hapless-horn exec php-apache bash
 > php artisan migrate

# Reset
docker rm $(docker ps -a -q) --force
docker rmi $(docker images -q) --force
docker volume rm $(docker volume ls -q)

```