#!/bin/bash

### Packeges from repos
# RPM-fusion
rpm-ostree install -y --apply-live \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


### Packeges from release
# set up requirements
rpm-ostree install --apply-live cabextract xorg-x11-font-utils curl jq
mkdir -p /var/roothome/.local/share/wget

## WezTerm
rpm -i https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly-fedora39.rpm

## font 'Timse New Roman'
rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

## Install all packegase from `GitHub`
# Specify the directory containing setup scripts
SETUP_DIR="/tmp/docker_src/install-dependences"

# Check if the directory exists
if [ ! -d "$SETUP_DIR" ]; then
    echo "Error: $SETUP_DIR directory not found."
    exit 1
fi

# Change directory to the setup directory
cd "$SETUP_DIR"
# Loop through each file in the setup directory
for script in *; do
    # Check if the file is executable and a regular file
    if [ -x "$script" ] && [ -f "$script" ]; then
        # Run the script
        echo '#################################################################'
        echo "### Running $script ..."
        ./"$script"
        echo "### Finished running $script"
        echo '#################################################################'
    else
        echo '#################################################################'
        echo "#!!! Skipping $script (not executable or not a regular file) !!!#"
        echo '#################################################################'
    fi
done
