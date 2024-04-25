#!/bin/bash

### Packeges from release
# font 'Timse New Roman'
rpm-ostree install --apply-live cabextract
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

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
        echo "Running $script ..."
        ./"$script"
        echo "Finished running $script"
    else
        echo "Skipping $script (not executable or not a regular file)"
    fi
done
