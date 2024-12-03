sudo mkdir /opt/aamp
sudo wget -O /opt/aamp/icon-8.4.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.4.png
sudo wget -O /opt/aamp/aamp-php8.4.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.4.sh
sudo chmod +x /opt/aamp/aamp-php8.4.sh
wget -O ~/.local/share/applications/aamp-php8.4.desktop https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.4.desktop
sudo chmod +x ~/.local/share/applications/aamp-php8.4.desktop
docker rm -f andreasvonburg/aamp:php8.4 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH </dev/tty
done
sudo sed -i "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php8.4.sh

echo "AAMP PHP 8.4 installed."