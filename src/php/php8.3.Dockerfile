FROM php:8.3-apache



###################
# Basics
###################


ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y nano net-tools libnss-myhostname curl gnupg apt-transport-https



###################
# PHP
###################


ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"  \
    && chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions pdo_mysql bcmath exif zip gd sockets intl igbinary \
    && docker-php-ext-enable opcache \
    && echo "\n\
        max_execution_time = 60\n\
        memory_limit = 265M\n\
        upload_max_filesize = 16M" >> "$PHP_INI_DIR/conf.d/docker-php-limits.ini"  \
    && echo "\n\
        pdo_mysql.default_socket = /var/run/mysqld/mysqld.sock" >> "$PHP_INI_DIR/conf.d/docker-php-pdo.ini"

#RUN apt-get update && apt-get install -y ghostscript libmagickwand-dev --no-install-recommends
#      && pecl install imagick \
#  	&& docker-php-ext-enable imagick

# RUN install-php-extensions imagick \
#    && sed -ri -e 's!<policy domain="coder" rights="none" pattern="PDF" />!<policy domain="coder" rights="read|write" pattern="PDF" />!g' /etc/ImageMagick-6/policy.xml \
#    && apt-get update && apt-get install -y ghostscript



###################
# APACHE
###################


RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf \
    && a2enmod rewrite expires deflate mime headers \
    && chown www-data:www-data /var/www/html \
# RequestHeader edit "If-None-Match" '^"((.*)-gzip)"$' '"$1", "$2"' \
# because of apache mod_deflate gzip bug https://bz.apache.org/bugzilla/show_bug.cgi?id=45023#c22
    && echo 'RequestHeader edit "If-None-Match" '"'"'^"((.*)-gzip)"$'"'"' '"'"'"$1", "$2"'"'" >> /etc/apache2/apache2.conf

ENV APACHE_RUN_USER=user
ENV APACHE_RUN_GROUP=user


# DOCUMENT ROOT

ENV APACHE_DOCUMENT_ROOT=/var/www/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && mkdir /var/www/public \
    && useradd -u 1001 -o -m user2 && groupmod -g 1001 user2 && chown user2:user2 /var/www/public \
    && echo '\n\
            <Directory "/var/www/public">\n\
                Options +Indexes +MultiViews +FollowSymLinks +SymLinksIfOwnerMatch \n\
                Allow from all\n\
            </Directory>' >> /etc/apache2/apache2.conf



###################
# MariaDB
###################

RUN curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash -s -- --mariadb-server-version="mariadb-10.11.7"

RUN apt-get update && apt-get install -y mariadb-server socket.io \
    && sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/*.cnf \
    && sed -i "s/#skip-name-resolve/skip-name-resolve/g" /etc/mysql/mariadb.conf.d/*.cnf \
    && mkdir /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

#VOLUME ["/var/lib/mysql"]

COPY ./scripts/mariadb-credentials-reset.sh /opt/
RUN chmod +x /opt/mariadb-credentials-reset.sh

EXPOSE 3306



###################
# RABBIT MQ
###################


RUN apt update \
	&& apt-get install rabbitmq-server -y --fix-missing \
#    && rabbitmq-plugins enable rabbitmq_management \
    && echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

COPY ./scripts/rabbitmq-management-enable.sh /opt/rabbitmq-management-enable.sh
RUN chmod +x /opt/rabbitmq-management-enable.sh

EXPOSE 5672
EXPOSE 15672



###################
# SUPERVISOR
###################


RUN apt-get update && apt-get install -y supervisor
COPY ./scripts/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

