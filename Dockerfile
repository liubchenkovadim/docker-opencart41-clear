FROM php:8.3-apache

# Встановлюємо розширення, які часто потрібні для CMS
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    git \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli gd zip

# Вмикаємо Apache mod_rewrite (CMS часто потрібно)
RUN a2enmod rewrite

# Встановлюємо робочу директорію
WORKDIR /var/www/html
RUN echo "upload_max_filesize = 128M\npost_max_size = 128M\nmemory_limit = 256M\nmax_execution_time = 300" \
    > /usr/local/etc/php/conf.d/custom.ini