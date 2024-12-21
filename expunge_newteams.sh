#!/bin/bash

# Kill Microsoft Teams process
sudo pkill -f "Microsoft Teams"

# Uninstall Microsoft Teams
sudo rm -rf /Applications/Microsoft\ Teams.app

# Remove user-specific Teams data
sudo rm -rf ~/Library/Application\ Support/Microsoft/Teams
sudo rm -rf ~/Library/Containers/com.microsoft.teams

# Remove system-wide Teams data
sudo rm -rf /Library/Application\ Support/Microsoft/Teams
sudo rm -rf /Library/Internet\ Plug-Ins/MeetingJoinPlugin.plugin

# Remove Teams remnants and .plists
sudo rm -f /Library/LaunchDaemons/com.microsoft.teams.TeamsUpdaterDaemon.plist
sudo rm -f /Library/Preferences/com.microsoft.teams.plist
sudo rm -rf ~/Library/Caches/com.microsoft.teams
sudo rm -rf ~/Library/HTTPStorages/com.microsoft.teams
sudo rm -rf '~/Library/Logs/Microsoft\ Teams\ Helper\ (Renderer)'
sudo rm -f ~/Library/Preferences/com.microsoft.teams.plist
sudo rm -rf ~/Library/Saved\ Application\ State/com.microsoft.teams.savedState
sudo rm -rf ~/Library/WebKit/com.microsoft.teams
sudo rm -f /private/var/db/receipts/com.microsoft.teams.bom
sudo rm -f /private/var/db/receipts/com.microsoft.teams.plist

