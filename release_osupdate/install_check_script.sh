#! /bin/bash

InactiveUpdates=$(defaults read /Library/Preferences/com.apple.SoftwareUpdate InactiveUpdates | sed 's/(//g' | sed 's/)//g' | sed '/^[[:space:]]*$/d'| sed 's/ //g')

if [ "$InactiveUpdates" ];then
    echo "###Action needed### Cleanup InactiveUpdate setting."
    exit 0
else     
    echo "###No action### InactiveUpdate not configured."
    echo "No action."
    exit 1
fi