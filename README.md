# AAMPR (Andi + Apache + MariaDB + PHP + RabbitMq)


## Just Run Example

Change /home/andy/workspace/htdocs to your local htdocs folder and the php version if necessary.

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


## Usage

### Apache

- http://localhost/

### MariaDB

- Port: 3306

### RabbitMQ 

- Port: 5672
- Management:  http://localhost:15672/ (User: guest, Password: guest)


## Install

You must have docker installed and docker should be running while installing.


### PHP 8.3

#### Debian / Linux Mint / Ubuntu

Docker must be running.

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3-linux-installer.sh | bash
```


#### Windows

Docker must be running. Use Powershell or Cmd

```powershell
powershell.exe -Command "Start-Process powershell -Verb RunAs -ArgumentList '/c Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3-windows-installer.ps1").Content'"
```


#### Mac

Docker must be running.

Install Xcode Command Line Tools

```bash
xcode-select --install
```

Execute Installer

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3-mac-installer.sh | bash
```

### PHP 8.2

#### Debian / Linux Mint / Ubuntu

Docker must be running.

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2-linux-installer.sh | bash
```


#### Windows

Docker must be running. Use Powershell or Cmd

```powershell
powershell.exe -Command "Start-Process powershell -Verb RunAs -ArgumentList '/c Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2-windows-installer.ps1").Content'"
```


#### Mac

Docker must be running.

Install Xcode Command Line Tools

```bash
xcode-select --install
```

Execute Installer

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2-mac-installer.sh | bash
```

### PHP 8.1

#### Debian / Linux Mint / Ubuntu

Docker must be running.

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1-linux-installer.sh | bash
```


#### Windows

Docker must be running. Use Powershell or Cmd

```powershell
powershell.exe -Command "Start-Process powershell -Verb RunAs -ArgumentList '/c Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1-windows-installer.ps1").Content'"
```


#### Mac

Docker must be running.

Install Xcode Command Line Tools

```bash
xcode-select --install
```

Execute Installer

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1-mac-installer.sh | bash
```

### PHP 8.0

#### Debian / Linux Mint / Ubuntu

Docker must be running.

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0-linux-installer.sh | bash
```


#### Windows

Docker must be running. Use Powershell or Cmd

```powershell
powershell.exe -Command "Start-Process powershell -Verb RunAs -ArgumentList '/c Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0-windows-installer.ps1").Content'"
```


#### Mac

Docker must be running.

Install Xcode Command Line Tools

```bash
xcode-select --install
```

Execute Installer

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0-mac-installer.sh | bash
```