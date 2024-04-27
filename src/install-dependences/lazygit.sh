#!/bin/bash
source /tmp/docker_src/library.sh

PACKAGE_NAME=lazygit
TMP_PATH=/tmp/${PACKAGE_NAME}

mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/jesseduffield/${PACKAGE_NAME}/tags
VERSION=$(get_latest_version $URL)
URL=https://github.com/jesseduffield/${PACKAGE_NAME}/releases/download/v${VERSION}/${PACKAGE_NAME}_${VERSION}_Linux_x86_64.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o ${PACKAGE_NAME}.tar.gz

tar --same-permissions --extract --file=${PACKAGE_NAME}.tar.gz
rm *gz

mv ${PACKAGE_NAME} /usr/bin

cd /
rm -rf $TMP_PATH
