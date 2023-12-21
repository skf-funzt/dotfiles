#!/bin/sh
# Check if yay is installed
if command -v yay &> /dev/null
then
    printf "Yay is installed, installing dashlane-cli-git..."
    # Install aconfmgr for Arch configuration management
    yay -Sy --needed --noconfirm dashlane-cli-git
    # Prompt the user for their Dashlane credentials
    printf "\n\nPlease enter your Dashlane credentials:\n\n"
    read -p "Email: " dashlane_email
    # Read the password in a secure manner
    read -s -p "Password: " dashlane_password
    printf "\n"
    read -p "OTP: " dashlane_otp
    # Pipe the credentials as one string each as newline into the Dashlane CLI
    # The order to pass is email, OTP, password
    {
        echo "$dashlane_email";
        sleep 2;
        echo "$dashlane_otp";
        sleep 2;
        echo "$dashlane_password";
    } | dcli configure save-master-password true
    dcli sync
else
    echo "Yay is not installed. Please install it and run this script again."
fi