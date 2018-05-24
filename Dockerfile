FROM php:7.2

LABEL maintainer="Nathan Daly <justlikephp@gmail.com>"

# No tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt -yqq update

# Install XDebug
RUN pear config-set preferred_state alpha && pecl install xdebug

# Enable PHP extensions
RUN docker-php-ext-enable xdebug

COPY xdebug.ini /etc/php/7.2/mods-available/xdebug.ini

# Copy the container start script
COPY start-container /usr/local/bin/start-container
RUN chmod +x /usr/local/bin/start-container

EXPOSE 80

CMD ["start-container"]