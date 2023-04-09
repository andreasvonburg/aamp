@ECHO OFF

TITLE Aamp PHP 8.2

docker stop aamp || true && docker rm aamp || true

docker run -it --rm -p 80:80 -v _path_to_docs_:/var/www/public -p 3306:3306 -v mariadb-data:/var/lib/mysql -p 5672:5672 -p 15672:15672 --name aamp andreasvonburg/aamp:php8.2

pause