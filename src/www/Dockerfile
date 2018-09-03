FROM php:7.2-apache
COPY html/ /var/www/html/
COPY wordpress.sh /usr/local/bin/
RUN docker-php-ext-install mysqli
ENTRYPOINT ["wordpress.sh"]
CMD ["apache2-foreground"]
EXPOSE 80