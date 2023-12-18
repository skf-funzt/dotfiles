#!/bin/sh

# exit immediately if dcli is already in $PATH
type dcli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install dcli on Darwin
    echo "Not implemented yet"
    ;;
Linux)
    # Check if pacman is installed
    if command -v pacman &> /dev/null
    then
        echo "Pacman is installed, installing chezmoi..."
        # Update pacman and install AUR helper yay
        sudo pacman -Syu --needed --noconfirm yay
    else
        echo "Pacman is not installed. Please install it and run this script again."
    fi

    # Check if yay is installed
    if command -v yay &> /dev/null
    then
        echo "Yay is installed, installing dashlane-cli-git..."
        # Install aconfmgr for Arch configuration management
        yay -Syu --needed --noconfirm asdf-vm dashlane-cli-git
    else
        echo "Yay is not installed. Please install it and run this script again."
    fi
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac