#!/bin/bash

# Check if OneDrive is installed
if [ -d "/Applications/OneDrive.app" ]; then
   # Offload the OneDrive app (removes the app but keeps user data)
   sudo rm -rf /Applications/OneDrive.app

   # Delete any remaining OneDrive related folders and files
   rm -rf ~/Library/Group\ Containers/*.OfficeOneDriveSync_mac
   rm -rf ~/Library/Group\ Containers/*.OfficeOneDriveSyncIntegration
   rm -rf ~/Library/Group\ Containers/*.OneDriveStandaloneSuite
   rm -rf ~/Library/Caches/com.microsoft.OneDrive
   rm -rf ~/Library/Application\ Scripts/com.microsoft.OneDrive.FinderSync
   rm -rf ~/Library/Application\ Support/OneDrive
   rm -rf ~/Library/Application\ Support/com.microsoft.OneDrive
   rm -rf ~/Library/Caches/OneDrive
   rm -rf ~/Library/Caches/com.microsoft.OneDriveStandaloneUpdater
   rm -rf ~/Library/Caches/com.microsoft.OneDriveUpdater
   rm -rf ~/Library/Caches/com.microsoft.SharePoint-mac
   rm -rf ~/Library/Caches/com.microsoft.SyncReporter
   rm -rf ~/Library/Containers/com.microsoft.OneDrive.FinderSync
   rm -rf ~/Library/Containers/com.microsoft.OneDriveLauncher
   rm -rf ~/Library/Containers/com.microsoft.OneDrive
   rm -rf ~/Library/Preferences/com.microsoft.OneDrive.plist
   rm -rf ~/Library/HTTPStorages/com.microsoft.OneDrive
   rm -f ~/Library/HTTPStorages/com.microsoft.OneDrive.binarycookies
   rm -rf ~/Library/HTTPStorages/com.microsoft.OneDriveStandaloneUpdater
   rm -f ~/Library/HTTPStorages/com.microsoft.OneDriveStandaloneUpdater.binarycookies
   rm -rf ~/Library/HTTPStorages/com.microsoft.OneDriveUpdater
   rm -f ~/Library/HTTPStorages/com.microsoft.OneDriveUpdater.binarycookies
   rm -rf ~/Library/Preferences/com.microsoft.OneDriveStandaloneUpdater.plist
   rm -rf ~/Library/Preferences/com.microsoft.OneDriveUpdater.plist
   rm -rf /Library/Logs/Microsoft/OneDrive
   rm -f ~/Library/Preferences/com.microsoft.OneDriveUpdater.plist
   rm -f ~/Library/Preferences/com.microsoft.SharePoint-mac.plist
   rm -rf ~/Library/Containers/com.microsoft.OneDrive.FileProvider
   rm -f /Library/LaunchAgents/com.microsoft.OneDriveStandaloneUpdater.plist
   rm -f /Library/LaunchDaemons/com.microsoft.OneDriveUpdaterDaemon.plist
   rm -f /Library/LaunchAgents/com.microsoft.SyncReporter.plist
   rm -f /var/db/receipts/com.microsoft.OneDrive.bom
   rm -f /var/db/receipts/com.microsoft.OneDrive.plist


   echo "OneDrive has been uninstalled and related files have been removed."
else
   echo "OneDrive is not installed on this system."
fi