sudo mkdir /opt/aamp
sudo curl -o /opt/aamp/icon-8.6.png https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/icon-8.6.png
sudo curl -o /opt/aamp/aamp-php8.6.command https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.6.app
sudo chmod +x /opt/aamp/aamp-php8.6.command
sudo curl -o /opt/aamp/aamp-php8.6.sh https://raw.githubusercontent.com/andreasvonburg/aamp/main/bin/php/aamp-php8.6.sh
sudo chmod +x /opt/aamp/aamp-php8.6.sh

docker image rm -f andreasvonburg/aamp:php8.6 2>/dev/null || true

HTDOCS_PATH=
while ! [[ "$HTDOCS_PATH" =~ ^/[^:\<\>\"\|\\\?\*#]*$ ]]
do
    read -p "Enter valid path to your htdocs (e. g. /holeradio/htdocs): " HTDOCS_PATH </dev/tty
done
sudo sed -i '' -e "s#_path_to_docs_#${HTDOCS_PATH}#" /opt/aamp/aamp-php8.6.sh

sudo xattr -cr /opt/aamp/aamp-php8.6.command
sudo codesign -s - -f /opt/aamp/aamp-php8.6.command
cp /opt/aamp/icon-8.6.png /tmp/aamp-icon-8.6.png
sips -i /tmp/aamp-icon-8.6.png
DeRez -only icns /tmp/aamp-icon-8.6.png > /tmp/aamp-icon-8.6.rsrc
sudo SetFile -a C /opt/aamp/aamp-php8.6.command
sudo Rez -append /tmp/aamp-icon-8.6.rsrc -o /opt/aamp/aamp-php8.6.command

/opt/aamp/aamp-php8.6.command & sleep 1 # command somehow needs be called before renaming it to .app otherwise it gets Killed 9
sudo mv /opt/aamp/aamp-php8.6.command "/Applications/AAMP PHP 8.6.app"

echo "AAMP 8.6 installed."
