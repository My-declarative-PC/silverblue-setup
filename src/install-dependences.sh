#!/bin/bash

  #
 ###
##### Packeges from repos
 ###
  #

### RPM-fusion
rpm-ostree install -y --apply-live \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


  #
 ###
##### Packeges from releases
 ###
  #

# set up requirements
rpm-ostree install --apply-live curl jq

### WezTerm
echo '#################################################################'
echo '### Running installing WezTerm ...'
rpm-ostree install https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly-fedora$(rpm -E %fedora).rpm || \
rpm-ostree install https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly-fedora$(($(rpm -E %fedora) - 1)).rpm
echo '### Finished running installing WezTerm'
echo '#################################################################'

### font 'Timse New Roman'
echo '#################################################################'
echo '### Running installing font "Timse New Roman" ...'
rpm-ostree install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
echo '### Finished running installing font "Timse New Roman"'
echo '#################################################################'

### Install all packegase from `GitHub-releases`
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
