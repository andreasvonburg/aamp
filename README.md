# Andi Apache Mysql PHP (aamp)


## Run Example
```bash
docker run -it --rm \
    -p 80:80 \
    -v /home/andy/workspace/htdocs:/var/www/html \
    -p 3306:3306 \
    -v mariadb-data:/var/lib/mysql \
    -e UID=1000 -e GID=1000 \
    --name aamp \
    andreasvonburg/aamp:php8.2
    
docker run -it --rm \
    -p 80:80 \
    --mount type=bind,source=/home/andy/testhtdocs,target=/var/www/html \
    -p 3306:3306 \
    -v mariadb-data:/var/lib/mysql \
    --name aamp \
    andreasvonburg/aamp:php8.2    
```



## Build Example
```bash
docker build -t andreasvonburg/aamp:php8.2 -f php8.2.Dockerfile .
```


