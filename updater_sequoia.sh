#!/bin/bash

# Check if running with sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script requires sudo privileges. Please run with sudo."
    exit 1
fi

# Check if macOS Sequoia installer exists, and install if necessary
if [[ ! -e "/Applications/Install macOS Sequoia.app" ]]; then
    echo "macOS Sequoia installer not found. Fetching installer..."
    read -p "Enter the version of macOS Sequoia you want to download (e.g., 15.2): " version
    softwareupdate --fetch-full-installer --full-installer-version $version
    # Check if installation was successful
    if [[ $? -eq 0 ]]; then
        echo "Installer downloaded successfully."
    else
        echo "Failed to download macOS Sequoia installer."
        exit 1
    fi
fi

# List available flash drives
echo "Available Flash Drives:"
diskutil list | awk '/external/'| grep -E '^/dev/disk'

# Prompt user to select a flash drive
read -p "Enter the number of the flash drive you want to format: /dev/disk" drive_number

# Format the selected drive with 16GB for Sequoia and the rest for Data
diskutil partitionDisk /dev/disk${drive_number} GPT JHFS+ Sequoia 19G exfat Data 0b

# Run commands consecutively with verbosity and no interaction
echo "Creating macOS Sequoia Installer..."
wait 5
echo "y" | /Applications/Install\ macOS\ Sequoia.app/Contents/Resources/createinstallmedia --volume /Volumes/Sequoia
