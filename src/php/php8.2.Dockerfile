FROM php:8.2-apache



###################
# Basics
###################


ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update && apt install -y nano net-tools libnss-myhostname curl gnupg apt-transport-https



###################
# PHP
###################


ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"  \
    && chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions pdo_mysql bcmath exif zip gd sockets intl \
    && docker-php-ext-enable opcache \
    && echo "\n\
        max_execution_time = 60\n\
        memory_limit = 265M" >> "$PHP_INI_DIR/conf.d/docker-php-limits.ini"  \
    && echo "\n\
        pdo_mysql.default_socket = /var/run/mysqld/mysqld.sock" >> "$PHP_INI_DIR/conf.d/docker-php-pdo.ini"



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

ENV APACHE_DOCUMENT_ROOT /var/www/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && mkdir /var/www/public \
    && echo '\n\
            <Directory "/var/www/public">\n\
                Options +Indexes +MultiViews +FollowSymLinks +SymLinksIfOwnerMatch \n\
                Allow from all\n\
            </Directory>' >> /etc/apache2/apache2.conf



###################
# MariaDB
###################


RUN apt-get update && apt-get install -y mariadb-server socket \
    && sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/* \
    && sed -i "s/#skip-name-resolve/skip-name-resolve/g" /etc/mysql/mariadb.conf.d/* \
    && mkdir /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

#VOLUME ["/var/lib/mysql"]

COPY ./scripts/mariadb-credentials-reset.sh /opt/

RUN chmod +x /opt/mariadb-credentials-reset.sh

EXPOSE 3306



###################
# RABBIT MQ
###################


RUN curl -1sLf "https://keys.openpgp.org/vks/v1/by-fingerprint/0A9AF2115F4687BD29803A206B73A36E6026DFCA" | gpg --dearmor | tee /usr/share/keyrings/com.rabbitmq.team.gpg > /dev/null \
	&& curl -1sLf "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf77f1eda57ebb1cc" | gpg --dearmor | tee /usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg > /dev/null \
	&& curl -1sLf "https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey" | gpg --dearmor | tee /usr/share/keyrings/io.packagecloud.rabbitmq.gpg > /dev/null \
	&&  echo "\n\
## Provides modern Erlang/OTP releases\n\
##\n\
## "bionic" as distribution name should work for any reasonably recent Ubuntu or Debian release.\n\
## See the release to distribution mapping table in RabbitMQ doc guides to learn more.\n\
deb [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main\n\
deb-src [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main\n\
\n\
## Provides RabbitMQ\n\
##\n\
## "bionic" as distribution name should work for any reasonably recent Ubuntu or Debian release.\n\
## See the release to distribution mapping table in RabbitMQ doc guides to learn more.\n\
deb [signed-by=/usr/share/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ bionic main\n\
deb-src [signed-by=/usr/share/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ bionic main\n\
	  " >> /etc/apt/sources.list.d/rabbitmq.list \
	&& apt update \
	&& apt-get install -y erlang-base \
							   erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
							   erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
							   erlang-runtime-tools erlang-snmp erlang-ssl \
							   erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl \
	&& apt install rabbitmq-server -y --fix-missing \
    && rabbitmq-plugins enable rabbitmq_management \
    && echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

EXPOSE 5672
EXPOSE 15672



###################
# SUPERVISOR
###################


RUN apt-get update && apt-get install -y supervisor
COPY ./scripts/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

