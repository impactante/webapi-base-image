FROM ubuntu:18.04
MAINTAINER contato@impactante.com.br

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt update && \
    apt upgrade -y &&\
    apt install curl -y && \
    apt install wget -y &&\
    apt install git -y && \
    apt install -y php &&\
    apt install php-pear \
    php-fpm \
    php-dev \
    php-zip \
    php-curl \
    php-xmlrpc \
    php-gd \
    php-mysql \
    php-sqlite3 \
    php-mbstring \
    php-xml \
    php-imagick \
    php-memcache \
    memcached \
    libapache2-mod-php -y && \
    wget -O phpunit.phar https://phar.phpunit.de/phpunit-5.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit && \
    php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin/ --filename=composer && \
    apt install php-xdebug -y && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2enmod rewrite

EXPOSE 80