#!/bin/sh

# Check if pacman is installed
if command -v pacman &> /dev/null
then
    echo "Pacman is installed, installing yay..."
    # Update pacman and install AUR helper yay
    sudo pacman -Sy --needed --noconfirm yay
else
    echo "Pacman is not installed. Please install it and run this script again."
fi