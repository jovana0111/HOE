# Usa PHP 8.2 con Apache
FROM php:8.2-apache

# Instala dependencias necesarias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Copia los archivos de tu aplicación
COPY . /var/www/html/

# Configura Apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html

# Puerto expuesto
EXPOSE 8080

# Comando de inicio
CMD ["apache2-foreground"]