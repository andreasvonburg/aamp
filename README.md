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


## Install

You must have docker installed and docker should be running while installing.


### PHP 8.3

#### Debian / Linux Mint / Ubuntu

Docker must be running.

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon-8.3.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.3.png
sudo wget -O /opt/aamp/aamp-php8.3.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3.sh
sudo chmod +x /opt/aamp/aamp-php8.3.sh
wget -O ~/.local/share/applications/aamp-php8.3.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.3.desktop
docker rm -f andreasvonburg/aamp:php8.3 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH
done
sudo sed -i "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php8.3.sh
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
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon-8.2.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.2.png
sudo wget -O /opt/aamp/aamp-php8.2.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.sh
sudo chmod +x /opt/aamp/aamp-php8.2.sh
wget -O ~/.local/share/applications/aamp-php8.2.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.2.desktop
docker rm -f andreasvonburg/aamp:php8.2 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH
done
sudo sed -i "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php8.2.sh
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
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon-8.1.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.1.png
sudo wget -O /opt/aamp/aamp-php8.1.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1.sh
sudo chmod +x /opt/aamp/aamp-php8.1.sh
wget -O ~/.local/share/applications/aamp-php8.1.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.1.desktop
docker rm -f andreasvonburg/aamp:php8.1 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH
done
sudo sed -i "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php8.1.sh
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
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon-8.0.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.0.png
sudo wget -O /opt/aamp/aamp-php8.0.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.sh
sudo chmod +x /opt/aamp/aamp-php8.0.sh
wget -O ~/.local/share/applications/aamp-php8.0.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.0.desktop
docker rm -f andreasvonburg/aamp:php8.0 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH
done
sudo sed -i "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php8.0.sh
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