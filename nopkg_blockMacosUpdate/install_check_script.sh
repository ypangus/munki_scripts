#! /bin/bash

#Change below to the version you wanna block, for example, block_macos_version="macOS 10.15.6 Update"
block_macos_version="macOS_10.xx.x Update"

InactiveUpdates=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate InactiveUpdates | grep "$block_macos_version" | sed 's/"//g' | sed 's/,//g')

if [ -z "$InactiveUpdates" ];then
    echo "###Action needed### InactiveUpdate for {${block_macos_version}} not configured."
    exit 0
else     
    echo "###No action### InactiveUpdate for {${block_macos_version}} configured."
    echo "No action."
    exit 1
fi