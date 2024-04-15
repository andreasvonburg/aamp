

### PHP __VERSION__

#### Debian / Linux Mint / Ubuntu

```bash
sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon-__VERSION__.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-__VERSION__.png
sudo wget -O /opt/aamp/aamp-php__VERSION__.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__.sh
sudo chmod +x /opt/aamp/aamp-php__VERSION__.sh
wget -O ~/.local/share/applications/aamp-php__VERSION__.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__.desktop
sudo chmod +x ~/.local/share/applications/aamp-php__VERSION__.desktop
docker rm -f andreasvonburg/aamp:php__VERSION__ 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH
done
sudo sed -i "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php__VERSION__.sh
```



Change /home/andy/workspace/htdocs to the path to your htdocs

```bash

```


#### Windows

Use Powershell

```powershell
New-Item "D:\apps\aamp" -Type Directory 
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__.bat" -OutFile "D:\apps\aamp\aamp-php__VERSION__.bat"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon.ico" -OutFile "D:\apps\aamp\icon.ico"

$SourceFilePath = "D:\apps\aamp\aamp-php__VERSION__.bat"
$ShortcutPath = ([Environment]::GetFolderPath("Desktop") + "\aamp-php__VERSION__.lnk")
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
$shortcut.TargetPath = $SourceFilePath
$shortcut.IconLocation = "D:\apps\aamp\icon-__VERSION__.ico"
$shortcut.Save()

docker rm andreasvonburg/aamp:php__VERSION__
```

Change E:\htdocs to the path to your htdocs

```powershell
((Get-Content -path D:\apps\aamp\aamp-php__VERSION__.bat -Raw) -replace '_path_to_docs_','E:\htdocs') | Set-Content -Path D:\apps\aamp\aamp-php__VERSION__.bat
```
