FROM php:7.2-apache

WORKDIR /var/www
COPY ./src /var/www

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get autoremove -y

RUN apt-get install -y zip unzip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN docker-php-ext-install pdo pdo_mysql

RUN composer install && \
    composer upgrade -n && \
    composer require laravel/helpers && \
    composer require "predis/predis":"~1.0"

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs

RUN npm install
RUN npm run prod

RUN chown -R www-data:www-data /var/www
RUN chmod 755 -R /var/www/storage
