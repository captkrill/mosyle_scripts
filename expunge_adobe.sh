#!/bin/sh

#Log uninstaller
exec > /tmp/adobe_uninstall.log 2>&1

UNINST_DIR="/Applications/adobeuninst"

# Create destination folder
mkdir "$UNINST_DIR"
cd "$UNINST_DIR"

# Download the zip file 
echo "Downloading..." 
curl -L -O 'https://helpx.adobe.com/content/dam/help/en/enterprise/using/uninstall-creative-cloud-products/jcr_content/root/content/flex/items/position/position-par/download_section/download-2/Uninstall_mac_pkg_All_Apps.zip'

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Failed to download zip file."
    exit 1
fi
unzip Uninstall_mac_pkg_All_Apps.zip
sleep 5

# Check if unzip was successful
if [ $? -ne 0 ]; then
    echo "Failed to unzip file."
    exit 1
fi

#Quit Adobe Apps
sudo osascript -e 'quit app "Creative Cloud"'
sudo osascript -e 'quit app "Acrobat Pro DC"'
sudo osascript -e 'quit app "Distiller"'
sudo osascript -e 'quit app "Adobe FormsCentral"'
sudo osascript -e 'quit app "AcroCEF"'
sudo osascript -e 'quit app "AdobeIPCBroker"'
sudo osascript -e 'quit app "After Effects"'
sudo osascript -e 'quit app "Flash"'
sudo osascript -e 'quit app "Flash CC"'
sudo osascript -e 'quit app "Animate CC"'
sudo osascript -e 'quit app "Audition"'
sudo osascript -e 'quit app "Adobe Audition CC"'
sudo osascript -e 'quit app "Adobe Bridge CS6"'
sudo osascript -e 'quit app "Adobe Bridge CC"'
sudo osascript -e 'quit app "Character Animator"'
sudo osascript -e 'quit app "Dreamweaver"'
sudo osascript -e 'quit app "Dreamweaver CC"'
sudo osascript -e 'quit app "Encore"'
sudo osascript -e 'quit app "Extension Manager"'
sudo osascript -e 'quit app "Flash Player"'
sudo osascript -e 'quit app "Illustrator"'
sudo osascript -e 'quit app "Illustrator CC"'
sudo osascript -e 'quit app "InDesign"'
sudo osascript -e 'quit app "InDesign CC"'
sudo osascript -e 'quit app "Lightroom"'
sudo osascript -e 'quit app "Adobe Media Encoder CS6"'
sudo osascript -e 'quit app "Adobe Media Encoder CC"'
sudo osascript -e 'quit app "Media Encoder CC"'
sudo osascript -e 'quit app "Adobe Muse CC"'
sudo osascript -e 'quit app "Photoshop"'
sudo osascript -e 'quit app "Photoshop CC"'
sudo osascript -e 'quit app "Prelude"'
sudo osascript -e 'quit app "Prelude CC"'
sudo osascript -e 'quit app "Premiere Pro"'
sudo osascript -e 'quit app "Premiere Pro CC"'
sudo osascript -e 'quit app "SpeedGrade CC"'

# Run the executable from the unzipped folder
cd "$UNINST_DIR/Uninstall_mac_pkg_All_Apps"
chmod +x AdobeCCUninstaller  # Make the executable runnable
./AdobeCCUninstaller  # Execute the file

# Check if the executable ran successfully
if [ $? -ne 0 ]; then
    echo "Executable failed to run."
    exit 1
fi

# Run additional commands here
# Example: cleanup downloaded zip file
rm -Rf "$UNINST_DIR"

#Remove Creative Cloud
cd "/Applications/Utilities/Adobe Creative Cloud/Utils/Creative Cloud Uninstaller.app/Contents/MacOS" 
./Creative\ Cloud\ Uninstaller -quiet
sleep 10

# Remove Adobe Components User Preferences & Receipts
echo "Running post-executable commands..."
sudo rm -Rf /Library/Application Support/Adobe/*
sudo rm -Rf /Library/Application Support/Adobe*
sudo rm -Rf /Library/Application Support/Macromedia/*
sudo rm -Rf /Library/Application Support/Macromedia*
sudo rm -Rf /Library/Application Support/regid*adobe/*
sudo rm -Rf /Library/Application Support/regid*adobe*
sudo rm -Rf /Library/Internet Plug-Ins/Adobe*
sudo rm -Rf /Library/Internet Plug-Ins/Flash*
sudo rm -Rf /Library/Internet Plug-Ins/flash*
sudo rm -Rf /Library/LaunchAgents/com.adobe*
sudo rm -Rf /Library/LaunchDaemons/com.adobe*
sudo rm -Rf /Library/Logs/Adobe/*
sudo rm -Rf /Library/Logs/Adobe*
sudo rm -Rf /Library/Logs/CreativeCloud/*
sudo rm -Rf /Library/Logs/CreativeCloud*
sudo rm -Rf /Library/Logs/DiagnosticReports/Adobe*
sudo rm -Rf /Library/Logs/DiagnosticReports/SpeedGrade*
sudo rm -Rf /Library/PreferencePanes/Flash*
sudo rm -Rf /Library/Preferences/com.Adobe*
sudo rm -Rf /Library/Preferences/com.adobe*
sudo rm -Rf /Library/PrivilegedHelperTools/com.adobe*
sudo rm -Rf /Library/ScriptingAdditions/Adobe*
sudo rm -Rf /private/var/root/Library/Logs/CreativeCloud/*
sudo rm -Rf /private/var/root/Library/Logs/CreativeCloud*
sudo rm -Rf /Users/Shared/Adobe*/*
sudo rm -Rf /Users/Shared/Adobe*
sudo rm -Rf /usr/local/bin/RemoteUpdateManager
sudo rm -Rf /usr/local/remotedesktop/*
sudo rm -Rf /usr/local/remotedesktop
sudo rm -Rf /Users/Shared/Adobe/*
sudo rm -Rf /Users/Shared/Adobe*
sudo rm -Rf /Users/*/Library/Application Scripts/com.adobe*
sudo rm -Rf /Users/*/Library/Application Support/Adobe/*
sudo rm -Rf /Users/*/Library/Application Support/Adobe*
sudo rm -Rf /Users/*/Library/Application Support/com.adobe*
sudo rm -Rf /Users/*/Library/Caches/Acrobat/*
sudo rm -Rf /Users/*/Library/Caches/Acrobat*
sudo rm -Rf /Users/*/Library/Caches/Adobe*/*
sudo rm -Rf /Users/*/Library/Caches/Adobe*
sudo rm -Rf /Users/*/Library/Caches/com.adobe*
sudo rm -Rf /Users/*/Library/Caches/CSXS/*
sudo rm -Rf /Users/*/Library/Caches/CSXS*
sudo rm -Rf /Users/*/Library/Containers/com.adobe*
sudo rm -Rf /Users/*/Library/Cookies/com.adobe*
sudo rm -Rf /Users/*/Library/Group Containers/Adobe*
sudo rm -Rf /Users/*/Library/Group Containers/com.adobe*
sudo rm -Rf /Users/*/Library/LaunchAgents/com.adobe*
sudo rm -Rf /Users/*/Library/Logs/Adobe*
sudo rm -Rf /Users/*/Library/Logs/amt3*
sudo rm -Rf /Users/*/Library/Logs/CreativeCloud/*
sudo rm -Rf /Users/*/Library/Logs/CreativeCloud*
sudo rm -Rf /Users/*/Library/Logs/CSXS/*
sudo rm -Rf /Users/*/Library/Logs/CSXS*
sudo rm -Rf /Users/*/Library/Logs/FlashPlayer*
sudo rm -Rf /Users/*/Library/Logs/Fuse*
sudo rm -Rf /Users/*/Library/Logs/NGLClient*
sudo rm -Rf /Users/*/Library/Logs/oobelib*
sudo rm -Rf /Users/*/Library/Logs/PDApp*
sudo rm -Rf /Users/*/Library/Logs/RemoteUpdateManager*
sudo rm -Rf /Users/*/Library/PhotoshopCrashes
sudo rm -Rf /Users/*/Library/Preferences/Adobe*/*
sudo rm -Rf /Users/*/Library/Preferences/Adobe*
sudo rm -Rf /Users/*/Library/Preferences/adobe*
sudo rm -Rf /Users/*/Library/Preferences/ByHost/com.adobe*
sudo rm -Rf /Users/*/Library/Preferences/com.Adobe*
sudo rm -Rf /Users/*/Library/Preferences/com.adobe*
sudo rm -Rf /Users/*/Library/Preferences/com.macromedia*
sudo rm -Rf /Users/*/Library/Preferences/Macromedia/*
sudo rm -Rf /Users/*/Library/Preferences/Macromedia*
sudo rm -Rf /Users/*/Library/Preferences/Shockwave*
sudo rm -Rf /Users/*/Library/Saved Application State/adobe*
sudo rm -Rf /Users/*/Library/Saved Application State/com.adobe*
sudo rm -Rf /Users/*/Library/Saved Application State/com.macromedia*
sudo rm -Rf /Users/*/Library/WebKit/com.adobe*
sudo rm -Rf /private/var/db/receipts/adobe*
sudo rm -Rf /private/var/db/receipts/com.adobe*
sudo rm -Rf /Applications/Adobe*/*
sudo rm -Rf /Applications/Adobe*/
sudo rm -Rf /Applications/Utilities/Adobe*/*
sudo rm -Rf /Applications/Utilities/Adobe*/

echo "Script completed successfully."
