

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


#### Windows

Use Powershell or Cmd

```powershell
powershell.exe -Command "Start-Process powershell -Verb RunAs -ArgumentList '/c Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__-windows-installer.ps1").Content'"
```


#### Mac

Install Xcode Command Line Tools

```bash
xcode-select --install
```

Execute Installer

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__-mac-installer.sh | bash
```