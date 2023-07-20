FROM dunglas/frankenphp:latest-php8.2-alpine

# Environements
ENV FRANKENPHP_CONFIG="worker ./public/index.php"
ENV APP_RUNTIME="Runtime\FrankenPhpSymfony\Runtime"

# Install packages
RUN apk update && \
    apk add \
    bash nodejs npm supervisor git

# Install php extensions
RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip \
    amqp \
    redis

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Install and yarn
RUN npm i -g yarn
