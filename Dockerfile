# Utilisez une image officielle de PHP
FROM php:7.4-apache

# Définissez le répertoire de travail dans le conteneur
WORKDIR /var/www/html

# Copiez les fichiers de votre projet PHP dans le conteneur
<<<<<<< HEAD
COPY . .
=======
COPY . /var/www/html

# Définir un point de montage pour les fichiers de données
VOLUME /var/www/html/data
>>>>>>> branchForDelete

# Installez les dépendances de votre projet PHP avec Composer
RUN apt-get update && apt-get install -y git && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-scripts --no-autoloader --ansi

# Définissez la configuration Apache pour exécuter votre projet PHP
RUN a2enmod rewrite && \
    sed -ri -e 's!/var/www/html!${PWD}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/!${PWD}/!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf && \
    chown -R www-data:www-data /var/www/html

# Exposez le port 80 pour l'accès à votre projet PHP via un navigateur web
EXPOSE 80

# Démarrez Apache pour exécuter votre projet PHP
CMD ["apache2-foreground"]    