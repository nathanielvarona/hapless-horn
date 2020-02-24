FROM php:7.2-fpm-alpine

WORKDIR /var/www

RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis
