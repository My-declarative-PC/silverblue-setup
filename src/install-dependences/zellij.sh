#! /bin/bash

mkdir -p /tmp/zellij

cd /tmp/zellij
curl -fL https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz -o zellij.tar.gz

tar --same-permissions --extract --file=zellij.tar.gz
rm *gz

mv zellij /usr/bin

cd /
rm -rf /tmp/zellij
