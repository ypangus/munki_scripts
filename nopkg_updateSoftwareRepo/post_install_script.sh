#! /bin/bash

#Change targetUrl to your munki server repo url.
targetUrl="example.com/munki_repo"
defaults write /Library/Preferences/ManagedInstalls SoftwareRepoURL -string "$targetUrl"

swReopUrl=$(defaults read /Library/Preferences/ManagedInstalls SoftwareRepoURL)

if [ "$swReopUrl" == "$targetUrl" ];then
    echo "SoftwareRepoURL = ${swReopUrl}, success."
    exit 0
else
    echo "SoftwareRepoURL = ${swReopUrl}, failed."
    exit 1
fi