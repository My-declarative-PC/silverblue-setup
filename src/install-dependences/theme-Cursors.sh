#! /bin/bash

### Cursors
TMP_DIR=/tmp/gtk_cursors
URL=https://github.com/catppuccin/cursors/releases/latest/download/Catppuccin-${FLAVOR}-${ACCENT}-Cursors.zip

# download
mkdir -p ${TMP_DIR}
echo "<<< ${URL} >>>"
curl -Lf -o ${TMP_DIR}/cursors.zip ${URL}
cd ${TMP_DIR}
unzip cursors.zip

# setup
cp -r Catppuccin-${FLAVOR}-${ACCENT}-Cursors /usr/share/icons

# cleanup
cd /
rm -rf ${TMP_DIR}
