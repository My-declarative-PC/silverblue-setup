#!/bin/bash
source /tmp/docker_src/library.sh

rpm-ostree install --apply-live helix

TMP_PATH=/tmp/helix
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/helix-editor/helix/tags
VERSION=$(get_latest_version $URL)
URL=https://github.com/helix-editor/helix/releases/download/${VERSION}/helix-${VERSION}-x86_64-linux.tar.xz
echo "<<< ${URL} >>>"
curl -fL $URL -o helix.tar.gz

tar --same-permissions --extract --file=helix.tar.gz
rm *gz
cd he*

mv -f ./hx /usr/bin/hx
mv -f ./runtime /usr/lib64/helix/runtime

cd /
rm -rf $TMP_PATH
