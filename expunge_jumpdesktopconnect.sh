#!/bin/sh

echo "--- Uninstalling Jump Desktop Connect ---" >> /tmp/jdi.log
date >> /tmp/jdi.log

launchctl unload /Library/LaunchDaemons/com.p5sys.jump.connect.service.plist
launchctl unload /Library/LaunchAgents/com.p5sys.jump.connect.agent.plist

sleep 3

sudo killall JumpConnect

rm -f /Library/LaunchDaemons/com.p5sys.jump.connect.service.plist
rm -f /Library/LaunchAgents/com.p5sys.jump.connect.agent.plist

rm -rf /Library/Audio/Plug-Ins/HAL/JumpAudio.driver
rm -rf /Library/Audio/Plug-Ins/HAL/JumpAudioMic.driver

sudo killall coreaudiod

rm -rf "/Applications/Jump Desktop Connect.app"

echo "--- Uninstall finished -- " >> /tmp/jdi.log
date >> /tmp/jdi.log