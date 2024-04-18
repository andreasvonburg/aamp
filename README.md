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



Change /home/andy/workspace/htdocs to the path to your htdocs

```bash

```


#### Windows

Use Powershell

```powershell
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3.bat" -OutFile "D:\apps\aamp\aamp-php8.3.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.3.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.3.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon-8.3.ico"
$shortcut.Save()

docker rm andreasvonburg/aamp:php8.3
```

Change E:\htdocs to the path to your htdocs

```powershell
((Get-Content -path D:\apps\aamp\aamp-php8.3.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.3.bat
```


#### Mac

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3-mac-installer.sh | bash
```

### PHP 8.2

#### Debian / Linux Mint / Ubuntu

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



Change /home/andy/workspace/htdocs to the path to your htdocs

```bash

```


#### Windows

Use Powershell

```powershell
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.bat" -OutFile "D:\apps\aamp\aamp-php8.2.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.2.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.2.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon-8.2.ico"
$shortcut.Save()

docker rm andreasvonburg/aamp:php8.2
```

Change E:\htdocs to the path to your htdocs

```powershell
((Get-Content -path D:\apps\aamp\aamp-php8.2.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.2.bat
```


#### Mac

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2-mac-installer.sh | bash
```

### PHP 8.1

#### Debian / Linux Mint / Ubuntu

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



Change /home/andy/workspace/htdocs to the path to your htdocs

```bash

```


#### Windows

Use Powershell

```powershell
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1.bat" -OutFile "D:\apps\aamp\aamp-php8.1.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.1.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.1.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon-8.1.ico"
$shortcut.Save()

docker rm andreasvonburg/aamp:php8.1
```

Change E:\htdocs to the path to your htdocs

```powershell
((Get-Content -path D:\apps\aamp\aamp-php8.1.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.1.bat
```


#### Mac

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1-mac-installer.sh | bash
```

### PHP 8.0

#### Debian / Linux Mint / Ubuntu

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



Change /home/andy/workspace/htdocs to the path to your htdocs

```bash

```


#### Windows

Use Powershell

```powershell
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.bat" -OutFile "D:\apps\aamp\aamp-php8.0.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.0.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.0.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon-8.0.ico"
$shortcut.Save()

docker rm andreasvonburg/aamp:php8.0
```

Change E:\htdocs to the path to your htdocs

```powershell
((Get-Content -path D:\apps\aamp\aamp-php8.0.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.0.bat
```


#### Mac

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0-mac-installer.sh | bash
```