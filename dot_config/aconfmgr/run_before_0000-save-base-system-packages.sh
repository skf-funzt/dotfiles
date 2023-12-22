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
mkdir -p ./config
# Echo to ignore the root path into a .sh file
echo "IgnorePath /" > ./config/00-ignore-root-path.sh

# Run aconfmgr
./aconfmgr save

# Move the file
mv ./config/99-unsorted.sh ./config/01-base-packages.sh

# Replace 'AddPackage' with 'IgnorePackage'
# sed -i 's/AddPackage/IgnorePackage/g' ./config/01-base-packages.sh

# Copy the file to dot_config/aconfmgr
cp ./config/01-base-packages.sh ../../
