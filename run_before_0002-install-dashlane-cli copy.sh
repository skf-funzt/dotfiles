#!/bin/sh

# Check if yay is installed
if command -v yay &> /dev/null
then
    echo "Yay is installed, installing dashlane-cli-git..."
    # Install aconfmgr for Arch configuration management
    yay -Sy --needed --noconfirm dashlane-cli-git
    # Login to Dashlane
    dcli sync &
    # Wait for Dashlane to finish syncing
    wait
else
    echo "Yay is not installed. Please install it and run this script again."
fi