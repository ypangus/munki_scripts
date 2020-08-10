#! /bin/bash

#Change below to the version you wanna block, for example, block_macos_version="macOS 10.15.6 Update"
block_macos_version="macOS_10.xx.x Update"

softwareupdate --ignore $block_macos_version

InactiveUpdates=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate InactiveUpdates | grep $block_macos_version)

if [ "$InactiveUpdates" ];then

    echo "InactiveUpdate for #${block_macos_version}# configured successfully."
    exit 0
else
    echo "InactiveUpdate for #${block_macos_version}# configured failed."
    exit 1
fi