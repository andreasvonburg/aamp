@ECHO OFF

TITLE Aamp PHP 8.3

REM Map htdocs of the WSL distro "aamp" as Windows drive (persists over reboots)
if not exist _htdocs_drive_\ (
    net use _htdocs_drive_ \\wsl.localhost\aamp\htdocs /persistent:yes >nul 2>&1 || ECHO Could not map _htdocs_drive_ to \\wsl.localhost\aamp\htdocs
)

REM Docker runs inside the WSL distro, so /htdocs is mounted with native speed
wsl -d aamp -- docker stop aamp >nul 2>&1
wsl -d aamp -- docker rm aamp >nul 2>&1

wsl -d aamp -- docker run -it --rm -p 80:80 -v /htdocs:/var/www/public -p 3306:3306 -v mariadb-10.11.7-data:/var/lib/mysql -p 5672:5672 -p 15672:15672 -e VUID=1000 -e VGID=1000 --name aamp andreasvonburg/aamp:php8.3

pause
