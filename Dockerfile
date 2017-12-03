FROM php:7.2-fpm-alpine

LABEL Maintainer="Zaher Ghaibeh <z@zah.me>" \
      Description="Lightweight container with PHP-FPM 7.2 with xDebug and redis based on Alpine Linux." \
      Date="3-12-2017"

RUN apk update \
    && apk add  --no-cache git mysql-client curl openssh-client icu libpng libjpeg-turbo \
    && apk add --no-cache --virtual build-dependencies libmcrypt libmcrypt-dev icu-dev \
    libxml2-dev freetype-dev libpng-dev libjpeg-turbo-dev g++ make autoconf \
    && docker-php-source extract \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-source delete \
    && docker-php-ext-install pdo_mysql intl zip gd \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir /src && cd /src && git clone https://github.com/xdebug/xdebug.git \
    && cd xdebug \
    && sh ./rebuild.sh \
    && echo "[xdebug]" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "zend_extension=xdebug.so" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && cd  / && rm -fr /src \
    && apk del build-dependencies \
    && rm -rf /tmp/* 

USER www-data

WORKDIR /var/www
CMD ["php-fpm"]