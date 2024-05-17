#!/bin/bash
source /tmp/docker_src/library.sh

TMP_PATH=/tmp/fzf
mkdir -p $TMP_PATH

cd $TMP_PATH
URL=https://api.github.com/repos/junegunn/fzf/tags
VERSION=$(get_latest_version $URL)
URL=https://github.com/junegunn/fzf/releases/download/${VERSION}/fzf-${VERSION}-linux_amd64.tar.gz
echo "<<< ${URL} >>>"
curl -fL $URL -o fzf.tar.gz

tar --same-permissions --extract --file=fzf.tar.gz
rm *gz

mv -f ./fzf /usr/bin/fzf

cd /
rm -rf $TMP_PATH
