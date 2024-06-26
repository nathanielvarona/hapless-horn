FROM php:7.2-apache

WORKDIR /var/www

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get autoremove -y

RUN apt-get install -y zip unzip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN docker-php-ext-install pdo pdo_mysql
