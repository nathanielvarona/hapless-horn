FROM php:7.2-apache

WORKDIR /var/www
COPY ./src /var/www

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y apt-utils git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN composer install

RUN docker-php-ext-install pdo pdo_mysql
