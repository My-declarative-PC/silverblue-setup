#! /bin/bash

PACKAGE_NAME=lazygit
TMP_PATH=/tmp/${PACKAGE_NAME}

mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/jesseduffield/${PACKAGE_NAME}/tags
VERSION=$(curl -fL $URL | jq 'max_by(.name).name' | sed 's/.*v\(.*\)".*/\1/g')
URL=https://github.com/jesseduffield/${PACKAGE_NAME}/releases/download/v${VERSION}/${PACKAGE_NAME}_${VERSION}_Linux_x86_64.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o ${PACKAGE_NAME}.tar.gz

tar --same-permissions --extract --file=${PACKAGE_NAME}.tar.gz
rm *gz

mv lazygit /usr/bin

cd /
rm -rf $TMP_PATH
