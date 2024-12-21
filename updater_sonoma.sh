#!/bin/bash

# Check if running with sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script requires sudo privileges. Please run with sudo."
    exit 1
fi

# Check if macOS Sonoma installer exists, and install if necessary
if [[ ! -e "/Applications/Install macOS Sonoma.app" ]]; then
    echo "macOS Sonoma installer not found. Fetching installer..."
    read -p "Enter the version of macOS Sonoma you want to download (e.g., 14.4.1): " version
    softwareupdate --fetch-full-installer --full-installer-version $version
    # Check if installation was successful
    if [[ $? -eq 0 ]]; then
        echo "Installer downloaded successfully."
    else
        echo "Failed to download macOS Sonoma installer."
        exit 1
    fi
fi

# List available flash drives
echo "Available Flash Drives:"
diskutil list | awk '/external/'| grep -E '^/dev/disk'

# Prompt user to select a flash drive
read -p "Enter the number of the flash drive you want to format: /dev/disk" drive_number

# Format the selected drive with 16GB for Sonoma and the rest for Data
diskutil partitionDisk /dev/disk${drive_number} GPT JHFS+ Sonoma 16G exfat Data 0b

# Run commands consecutively with verbosity and no interaction
echo "Creating macOS Sonoma Installer..."
wait 5
echo "y" | /Applications/Install\ macOS\ Sonoma.app/Contents/Resources/createinstallmedia --volume /Volumes/Sonoma
