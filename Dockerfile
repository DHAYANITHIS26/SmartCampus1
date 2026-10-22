
FROM php:8.2-apache

# Enable common PHP MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Configure Apache to listen on Render's web service port
RUN sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf \
    && sed -i 's/<VirtualHost \*:80>/<VirtualHost *:10000>/' /etc/apache2/sites-available/000-default.conf

# Copy project files into Apache's web directory
COPY . /var/www/html/

EXPOSE 10000
