#!/bin/sh

# Create a temporary directory
mkdir -p ./.tmp

# Download and unzip the master.zip file from CyberShadow/aconfmgr repository
curl -f -L -o ./.tmp/master.zip https://github.com/CyberShadow/aconfmgr/archive/master.zip

# Remove old aconfmgr-master directory
rm -rf ./.tmp/aconfmgr-master || true

# Unzip the master.zip file
unzip -o ./.tmp/master.zip -d ./.tmp

# Delete the master.zip file
rm ./.tmp/master.zip

# Change directory to aconfmgr-master
cd ./.tmp/aconfmgr-master

# Make a config directory
mkdir -p .config
# printf to ignore the root path into a .sh file
printf "IgnorePath '/*'" > .config/00-ignore-root-path.sh

# Update the package database
sudo pacman -Sy

# Run aconfmgr
./aconfmgr save -c .config

# Move the file
mv .config/99-unsorted.sh ~/.config/aconfmgr/01-base-packages.sh

# Replace 'AddPackage' with 'IgnorePackage'
# sed -i 's/AddPackage/IgnorePackage/g' .config/aconfmgr/01-base-packages.sh

# Copy the file to dot_config/aconfmgr
# cp .config/aconfmgr/01-base-packages.sh 01-base-packages.sh
