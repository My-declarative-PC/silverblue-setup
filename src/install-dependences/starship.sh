#! /bin/bash

PACKAGE_NAME=starship
TMP_PATH=/tmp/${PACKAGE_NAME}

mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/starship/${PACKAGE_NAME}/tags
VERSION=$(curl -fL $URL | jq 'max_by(.name).name' | sed 's/.*v\(.*\)".*/\1/g')
URL=https://github.com/starship/starship/releases/download/v${VERSION}/${PACKAGE_NAME}-x86_64-unknown-linux-gnu.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o ${PACKAGE_NAME}.tar.gz

tar --same-permissions --extract --file=${PACKAGE_NAME}.tar.gz
rm *gz

mv ${PACKAGE_NAME} /usr/bin

cd /
rm -rf $TMP_PATH
