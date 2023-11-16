#! /bin/bash

mkdir -p /tmp/eza

cd /tmp/eza
wget https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O eza.tar.gz

tar -xf eza.tar.gz
rm *gz

mv eza /usr/bin
