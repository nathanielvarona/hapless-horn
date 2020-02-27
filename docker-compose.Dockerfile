FROM php:7.2-fpm-alpine

WORKDIR /var/www

RUN apk add autoconf wget
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN docker-php-ext-install pdo pdo_mysql
