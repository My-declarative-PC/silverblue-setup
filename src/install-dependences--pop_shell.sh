#! /bin/bash

# dependencies
mkdir -p /var/roothome/.npm
mkdir -p /var/usrlocal
rpm-ostree install \
    nodejs \
    npm
npm install -g typescript

# download
mkdir -p /tmp/pop_shell
cd /tmp/pop_shell
git clone -b master_mantic https://github.com/pop-os/shell.git shell

# setup
cd shell
DESTDIR=/tmp/compile_pop_shell
mkdir -p $DESTDIR
sed -i '1s/^/DESTDIR = \/tmp\/compile_pop_shell\n\n/' Makefile
make depcheck && make compile && make install
cd $DESTDIR
cp -r usr/* /usr/
