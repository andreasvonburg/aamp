FROM php:8.2-apache



###################
# Timezone
###################


ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install -y nano



###################
# PHP
###################


ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions pdo_mysql bcmath exif zip gd sockets intl \
    && docker-php-ext-enable opcache \
    && echo "\n\
        max_execution_time = 60\n\
        memory_limit = 265M" >> "$PHP_INI_DIR/conf.d/docker-php-limits.ini"



###################
# APACHE
###################


RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf \
    && a2enmod rewrite expires deflate mime headers \
    && chown www-data:www-data /var/www/html

# RequestHeader edit "If-None-Match" '^"((.*)-gzip)"$' '"$1", "$2"' \
# because of apache mod_deflate gzip bug https://bz.apache.org/bugzilla/show_bug.cgi?id=45023#c22
RUN echo 'RequestHeader edit "If-None-Match" '"'"'^"((.*)-gzip)"$'"'"' '"'"'"$1", "$2"'"'" >> /etc/apache2/apache2.conf



ENV APACHE_RUN_USER=user
ENV APACHE_RUN_GROUP=user


###################
# MariaDB
###################

RUN apt-get update && apt-get install -y mariadb-server \
    && sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/* \
    && mkdir /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

#VOLUME ["/var/lib/mysql"]

COPY ./scripts/mariadb-credentials-reset.sh /opt/

RUN chmod +x /opt/mariadb-credentials-reset.sh

EXPOSE 3306



###################
# SUPERVISOR
###################


RUN apt-get update && apt-get install -y supervisor
COPY ./scripts/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

