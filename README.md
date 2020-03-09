# hapless-horn

## Quick Start for Docker Compose

Prepare the Docker Composer Environment

```bash
cd ./hapless-horn
export COMPOSE_PROJECT_NAME=hapless-horn
```

Docker Base Images Requirements

```bash
docker-compose pull
docker-compose build
```

Laravel Platform Requirements

```bash
docker-compose run --rm php composer install
docker-compose run --rm php composer upgrade -n
docker-compose run --rm php composer require laravel/helpers
docker-compose run --rm php composer require "predis/predis":"~1.0"
docker-compose run --rm php php artisan key:generate
docker-compose run --rm php php artisan session:table
docker-compose run --rm php php artisan migrate
docker-compose run --rm php php artisan config:cache
```

Start up

```bash
docker-compose up -d
```

Resetting Data and Start Over

```bash
docker-compose down
docker rm $(docker ps -a -q) --force
docker rmi $(docker images -q) --force
docker volume rm $(docker volume ls -q)
```

## Minikube Commands

Creating a Minikube Profile
```bash
minikube start --kubernetes-version 1.14.10 --profile hapless-horn

# Copy the Kube Config to Project Directory
mv ~/.kube/config $(pwd)/kubeconfig.yaml
```

Starting a Minikube Profile
```bash
minikube profile hapless-horn
export KUBECONFIG=$(pwd)/kubeconfig.yaml
minikube start
eval $(minikube docker-env)

# Make sure `kubectl` and `docker` cli works well and connected to Minikube VM
docker version
kubectl version
```

## Docker build

```bash
docker build -t hapless-horn:php-apache-v1 -f kubernetes-php-apache.Dockerfile .
docker build -t hapless-horn:php-fpm-v1 -f kubernetes-php-fpm.Dockerfile .

# Creating a New Version of Docker Image
docker build -t hapless-horn:php-apache-v2 -f kubernetes-php-apache.Dockerfile .
docker build -t hapless-horn:php-fpm-v2 -f kubernetes-php-fpm.Dockerfile .
```
