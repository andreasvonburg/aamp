# AAMPR (Andi + Apache + MariaDB + PHP + RabbitMq)


## Just Run Example

Change /home/andy/workspace/htdocs to your local htdocs folder.

```bash
docker run -it --rm \
    -p 80:80 \
    -v /home/andy/workspace/htdocs:/var/www/public \
    -p 3306:3306 \
    -v mariadb-data:/var/lib/mysql \
    -p 5672:5672 -p 15672:15672 \
    -e VUID=$(id -u) -e VGID=$(id -g) \
    --name aamp \
    andreasvonburg/aamp:php8.2
```



## Install

### PHP 8.2

#### Ubuntu

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.png
sudo wget -O /opt/aamp/aamp-php8.2.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.sh
sudo chmod +x /opt/aamp/aamp-php8.2.sh
sudo wget -O ~/.local/share/applications/aamp-php8.2.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.desktop
```

Change /home/andy/workspace/htdocs to the path to your htdocs

```
sed -i 's#_path_to_docs_#/home/andy/workspace/htdocs#' /opt/aamp/aamp-php8.2.sh
```

#### Windows

Use Powershell

```
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.bat","D:\apps\aamp\aamp8.2.bat")

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.bat" -OutFile "D:\apps\aamp\aamp8.2.bat"
```

## Build Example

```bash
docker build -t andreasvonburg/aamp:php8.2 -f php8.2.Dockerfile .
```


## Push Example

```bash
docker push andreasvonburg/aamp:php8.2
```





