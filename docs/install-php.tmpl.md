

### PHP __VERSION__

#### Debian / Linux Mint / Ubuntu

Docker must be running.

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__-linux-installer.sh | bash
```


#### Windows

Docker must be running. Use Powershell or Cmd

```powershell
powershell.exe -Command "Start-Process powershell -Verb RunAs -ArgumentList '/c Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__-windows-installer.ps1").Content'"
```


#### Mac

Docker must be running.

Install Xcode Command Line Tools

```bash
xcode-select --install
```

Execute Installer

```bash
curl https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php__VERSION__-mac-installer.sh | bash
```