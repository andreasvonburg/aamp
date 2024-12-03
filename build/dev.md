# Dev and build infos


## Docker images

```bash
VERSIONS=(8.4 8.3 8.2 8.1 8.0)
MARIADB_VERSION=10.11.7

for VERSION in ${VERSIONS[@]}; do
    cp -f ../src/php/php.Dockerfile.tmpl ../src/php/php${VERSION}.Dockerfile
    sed -i "s/__VERSION__/${VERSION}/g" ../src/php/php${VERSION}.Dockerfile
    sed -i "s/__MARIADB_VERSION__/${MARIADB_VERSION}/g" ../src/php/php${VERSION}.Dockerfile
    docker build -t andreasvonburg/aamp:php${VERSION} -f ../src/php/php${VERSION}.Dockerfile ../src/php/
done
```

```bash
VERSIONS=(8.4 8.3 8.2 8.1 8.0)

docker login

for VERSION in ${VERSIONS[@]}; do
    docker push andreasvonburg/aamp:php${VERSION}
done
```


## bin/php and README.md

```bash
VERSIONS=(8.4 8.3 8.2 8.1 8.0)
MARIADB_VERSION=10.11.7


for VERSION in ${VERSIONS[@]}; do
    cp -f ../bin/php/aamp-php-windows-installer.ps1.tmpl ../bin/php/aamp-php${VERSION}-windows-installer.ps1
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}-windows-installer.ps1

    cp -f ../bin/php/aamp-php.bat.tmpl ../bin/php/aamp-php${VERSION}.bat
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}.bat
    sed -i "s/__MARIADB_VERSION__/${MARIADB_VERSION}/g" ../bin/php/aamp-php${VERSION}.bat
    
    cp -f ../bin/php/aamp-php-linux-installer.sh.tmpl ../bin/php/aamp-php${VERSION}-linux-installer.sh
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}-linux-installer.sh
    
    cp -f ../bin/php/aamp-php.desktop.tmpl ../bin/php/aamp-php${VERSION}.desktop
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}.desktop
    
    cp -f ../bin/php/aamp-php.app.tmpl ../bin/php/aamp-php${VERSION}.app
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}.app
    
    cp -f ../bin/php/aamp-php-mac-installer.sh.tmpl ../bin/php/aamp-php${VERSION}-mac-installer.sh
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}-mac-installer.sh
    
    cp -f ../bin/php/aamp-php.sh.tmpl ../bin/php/aamp-php${VERSION}.sh
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}.sh
    sed -i "s/__MARIADB_VERSION__/${MARIADB_VERSION}/g" ../bin/php/aamp-php${VERSION}.sh
done


cp -f ../docs/readme.tmpl.md ../README.md
cat ../docs/install-intro.tmpl.md >> ../README.md

for VERSION in ${VERSIONS[@]}; do
    sed "s/__VERSION__/${VERSION}/g" ../docs/install-php.tmpl.md >> ../README.md
done
```


# Build and run single image

## Build

```bash
VERSION=8.4
MARIADB_VERSION=10.11.7

cp -f ../src/php/php.Dockerfile.tmpl ../src/php/php${VERSION}.Dockerfile
sed -i "s/__VERSION__/${VERSION}/g" ../src/php/php${VERSION}.Dockerfile
sed -i "s/__MARIADB_VERSION__/${MARIADB_VERSION}/g" ../src/php/php${VERSION}.Dockerfile
docker build -t andreasvonburg/aamp:php${VERSION} -f ../src/php/php${VERSION}.Dockerfile --platform linux/amd64,linux/arm64 ../src/php/
```

## Run

```bash
VERSION=8.3
MARIADB_VERSION=10.11.7

docker stop aamp || true
docker rm aamp || true

docker run -it --rm \
    -p 80:80 \
    -v /home/andy/workspace/htdocs:/var/www/public \
    -p 3306:3306 \
    -v mariadb-${MARIADB_VERSION}-data:/var/lib/mysql \
    -p 5672:5672 -p 15672:15672 \
    -e VUID=$(id -u) -e VGID=$(id -g) \
    --name aamp \
    andreasvonburg/aamp:php${VERSION}
```