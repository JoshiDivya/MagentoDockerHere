FROM php:7.4-fpm-alpine3.13
 
WORKDIR /var/www/html

RUN apk add icu-dev && apk add --update --no-cache g++ gcc libxslt-dev

RUN apk add --no-cache \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && docker-php-ext-configure gd \
      --with-freetype=/usr/include/ \
      # --with-png=/usr/include/ \ # No longer necessary as of 7.4; https://github.com/docker-library/php/pull/910#issuecomment-559383597
      --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable gd \
    && apk del --no-cache \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
    && rm -rf /tmp/*
	
RUN apk add --no-cache zip libzip-dev

RUN docker-php-ext-configure zip

RUN docker-php-ext-install zip

RUN docker-php-ext-install iconv intl xml soap opcache pdo pdo_mysql xsl bcmath sockets

COPY src .

RUN addgroup -g 1000 magento && adduser -G magento -g magento -s /bin/sh -D magento

USER magento 
 
# RUN chown -R laravel:laravel .