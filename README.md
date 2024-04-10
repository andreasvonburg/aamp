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


### PHP __VERSION__

#### Debian / Linux Mint / Ubuntu

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.png
sudo wget -O /opt/aamp/aamp-php__VERSION__.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__.sh
sudo chmod +x /opt/aamp/aamp-php__VERSION__.sh
wget -O ~/.local/share/applications/aamp-php__VERSION__.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__.desktop
sudo chmod +x ~/.local/share/applications/aamp-php__VERSION__.desktop
```

Change /home/andy/workspace/htdocs to the path to your htdocs

```
sudo sed -i 's#_path_to_docs_#/home/andy/workspace/htdocs#' /opt/aamp/aamp-php__VERSION__.sh
```


#### Windows

Use Powershell

```
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__.bat" -OutFile "D:\apps\aamp\aamp-php__VERSION__.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php__VERSION__.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php__VERSION__.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon.ico"
$shortcut.Save()
```

Change E:\htdocs to the path to your htdocs

```
((Get-Content -path D:\apps\aamp\aamp-php__VERSION__.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php__VERSION__.bat
```


### PHP 8.3

#### Debian / Linux Mint / Ubuntu

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.png
sudo wget -O /opt/aamp/aamp-php8.3.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3.sh
sudo chmod +x /opt/aamp/aamp-php8.3.sh
wget -O ~/.local/share/applications/aamp-php8.3.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.3.desktop
```

Change /home/andy/workspace/htdocs to the path to your htdocs

```
sudo sed -i 's#_path_to_docs_#/home/andy/workspace/htdocs#' /opt/aamp/aamp-php8.3.sh
```


#### Windows

Use Powershell

```
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.3.bat" -OutFile "D:\apps\aamp\aamp-php8.3.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.3.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.3.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon.ico"
$shortcut.Save()
```

Change E:\htdocs to the path to your htdocs

```
((Get-Content -path D:\apps\aamp\aamp-php8.3.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.3.bat
```


### PHP 8.2

#### Debian / Linux Mint / Ubuntu

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.png
sudo wget -O /opt/aamp/aamp-php8.2.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.sh
sudo chmod +x /opt/aamp/aamp-php8.2.sh
wget -O ~/.local/share/applications/aamp-php8.2.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.2.desktop
```

Change /home/andy/workspace/htdocs to the path to your htdocs

```
sudo sed -i 's#_path_to_docs_#/home/andy/workspace/htdocs#' /opt/aamp/aamp-php8.2.sh
```


#### Windows

Use Powershell

```
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.2.bat" -OutFile "D:\apps\aamp\aamp-php8.2.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.2.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.2.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon.ico"
$shortcut.Save()
```

Change E:\htdocs to the path to your htdocs

```
((Get-Content -path D:\apps\aamp\aamp-php8.2.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.2.bat
```


### PHP 8.1

#### Debian / Linux Mint / Ubuntu

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.png
sudo wget -O /opt/aamp/aamp-php8.1.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1.sh
sudo chmod +x /opt/aamp/aamp-php8.1.sh
wget -O ~/.local/share/applications/aamp-php8.1.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.1.desktop
```

Change /home/andy/workspace/htdocs to the path to your htdocs

```
sudo sed -i 's#_path_to_docs_#/home/andy/workspace/htdocs#' /opt/aamp/aamp-php8.1.sh
```


#### Windows

Use Powershell

```
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.1.bat" -OutFile "D:\apps\aamp\aamp-php8.1.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.1.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.1.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon.ico"
$shortcut.Save()
```

Change E:\htdocs to the path to your htdocs

```
((Get-Content -path D:\apps\aamp\aamp-php8.1.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.1.bat
```


### PHP 8.0

#### Debian / Linux Mint / Ubuntu

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.png
sudo wget -O /opt/aamp/aamp-php8.0.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.sh
sudo chmod +x /opt/aamp/aamp-php8.0.sh
wget -O ~/.local/share/applications/aamp-php8.0.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.0.desktop
```

Change /home/andy/workspace/htdocs to the path to your htdocs

```
sudo sed -i 's#_path_to_docs_#/home/andy/workspace/htdocs#' /opt/aamp/aamp-php8.0.sh
```


#### Windows

Use Powershell

```
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.bat" -OutFile "D:\apps\aamp\aamp-php8.0.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php8.0.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php8.0.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon.ico"
$shortcut.Save()
```

Change E:\htdocs to the path to your htdocs

```
((Get-Content -path D:\apps\aamp\aamp-php8.0.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php8.0.bat
```
