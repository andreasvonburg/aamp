# AAMP (Andi + Apache + MariaDB + PHP)


## Just Run Example

Change /home/andy/workspace/htdocs to your local htdocs folder.

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
sudo mkdir /opt/aamp

cd /opt/aamp
sudo wget -O icon.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.png
sudo wget -O aamp-php8.2.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.sh
sudo chmod +x aamp-php8.2.sh

sudo echo '[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=true
Exec=/opt/aamp/aamp-php8.2.sh
Name=AAMP PHP 8.2
Icon=/opt/aamp/icon.png' > ~/.local/share/applications/aamp-php8.2.desktop 
```



## Build Example

```bash
docker build -t andreasvonburg/aamp:php8.2 -f php8.2.Dockerfile .
```


## Push Example

```bash
docker push andreasvonburg/aamp:php8.2
```






