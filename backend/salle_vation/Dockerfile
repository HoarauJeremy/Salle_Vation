FROM composer:2 AS composer_stage
WORKDIR /app

FROM php:8.4.8-fpm-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \ 
    git curl zip unzip \
    libicu-dev libpng-dev libjpeg-dev libwebp-dev \ 
    libzip-dev libonig-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg --with-webp \
    && docker-php-ext-install -j"$(nproc)" \
        gd intl mbstring exif pcntl bcmath pdo_mysql zip


COPY --from=composer_stage /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . /var/www/
RUN chown -R www-data:www-data /var/www/

USER www-data

EXPOSE 9000