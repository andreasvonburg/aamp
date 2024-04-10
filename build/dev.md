# Dev and build infos


## prepare

```bash
docker login

VERSIONS=(8.3 8.2 8.1 8.0)
```


## Docker images

```bash
for VERSION in ${VERSIONS[@]}; do
    cp -f src/php/php.Dockerfile.tmpl src/php/php${VERSION}.Dockerfile
    sed -i "s/__VERSION__/${VERSION}/g" src/php/php${VERSION}.Dockerfile
    docker build -t andreasvonburg/aamp:php${VERSION} -f src/php/php${VERSION}.Dockerfile src/php/
    docker push andreasvonburg/aamp:php${VERSION}
done
```


## bin/php

```bash
VERSIONS=(8.3 8.2 8.1 8.0)

for VERSION in ${VERSIONS[@]}; do
    cp -f ../bin/php/aamp-php.bat.tmpl ../bin/php/aamp-php${VERSION}.bat
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}.bat
    cp -f ../bin/php/aamp-php.desktop.tmpl ../bin/php/aamp-php${VERSION}.desktop
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}.desktop
    cp -f ../bin/php/aamp-php.sh.tmpl ../bin/php/aamp-php${VERSION}.sh
    sed -i "s/__VERSION__/${VERSION}/g" ../bin/php/aamp-php${VERSION}.sh
done
```


## README.md

```bash
VERSIONS=(8.3 8.2 8.1 8.0)

cp -f ../docs/readme.tmpl.md ../README.md

cat ../docs/install-php.tmpl.md >> ../README.md

for VERSION in ${VERSIONS[@]}; do
    sed "s/__VERSION__/${VERSION}/g" ../docs/install-php.tmpl.md >> ../README.md
done
```
