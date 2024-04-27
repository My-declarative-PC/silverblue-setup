#! /bin/bash

rpm-ostree install --apply-live helix

TMP_PATH=/tmp/helix
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/helix-editor/helix/tags
VERSION=$(curl -fL $URL | jq -r '.[] | select(.name | test("^v") | not) | .name' | sort -V | tail -n 1)
URL=https://github.com/helix-editor/helix/releases/download/${VERSION}/helix-${VERSION}-x86_64-linux.tar.xz
echo "<<< ${URL} >>>"
curl -fL $URL -o helix.tar.gz

tar --same-permissions --extract --file=helix.tar.gz
rm *gz
cd he*

mv -f ./hx /usr/bin/hx

cd /
rm -rf $TMP_PATH
