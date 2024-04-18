sudo mkdir /opt/aamp
sudo curl -o /opt/aamp/icon-8.0.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.0.png
sudo curl -o /opt/aamp/aamp-php8.0.command https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.app
sudo chmod +x /opt/aamp/aamp-php8.0.command
sudo curl -o /opt/aamp/aamp-php8.0.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.0.sh
sudo chmod +x /opt/aamp/aamp-php8.0.sh

docker rm -f andreasvonburg/aamp:php8.0 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH </dev/tty
done
sudo sed -i '' -e "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php8.0.sh

sudo xattr -cr /opt/aamp/aamp-php8.0.command
sudo codesign -s - -f /opt/aamp/aamp-php8.0.command
cp /opt/aamp/icon-8.0.png /tmp/aamp-icon-8.0.png
sips -i /tmp/aamp-icon-8.0.png
DeRez -only icns /tmp/aamp-icon-8.0.png > /tmp/aamp-icon-8.0.rsrc
sudo SetFile -a C /opt/aamp/aamp-php8.0.command
sudo Rez -append /tmp/aamp-icon-8.0.rsrc -o /opt/aamp/aamp-php8.0.command
sudo mv /opt/aamp/aamp-php8.0.command "/Applications/AAMP PHP 8.0.app"