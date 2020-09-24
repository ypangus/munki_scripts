#! /bin/bash

sudo softwareupdate --reset-ignored

InactiveUpdates=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate InactiveUpdates | sed 's/(//g' | sed 's/)//g' | sed '/^[[:space:]]*$/d'| sed 's/ //g')

if [ "$InactiveUpdates" ];then
    echo "release osupdate failed."
    exit 1
else     
    echo "release osupdate success."
    exit 0
fi