# AAMP (Andi + Apache + MariaDB + PHP)


## Just Run Example

```bash
docker run -it --rm \
    -p 80:80 \
    -v /home/andy/workspace/htdocs:/var/www/public \
    -p 3306:3306 \
    -v mariadb-data:/var/lib/mysql \
    -e VUID=$(id -u) -e VGID=$(id -g) \
    --name aamp \
    andreasvonburg/aamp:php8.2
```



## Install

### Ubuntu

```bash

```



## Build Example
```bash
docker build -t andreasvonburg/aamp:php8.2 -f php8.2.Dockerfile .
```




