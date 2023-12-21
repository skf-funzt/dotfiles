#!/bin/sh

# Check if yay is installed
if command -v yay &> /dev/null
then
    echo "Yay is installed, installing aconfmgr-git..."
    # Install aconfmgr for Arch configuration management
    yay -Sy --needed --noconfirm aconfmgr-git
    # Save the current system packages
    aconfmgr save
    # Move the file
    mv ./config/aconfmgr/99-unsorted.sh ./config/aconfmgr/01-base-packages.sh
else
    echo "Yay is not installed. Please install it and run this script again."
fi