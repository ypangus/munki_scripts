#! /bin/bash

#Change targetUrl to your munki server repo url.
targetUrl="example.com/munki_repo"
swReopUrl=$(defaults read /Library/Preferences/ManagedInstalls SoftwareRepoURL)

if [ ! $swReopUrl ];then
    echo "SoftwareRepoURL: Not set."
    echo "Let configure it."
    exit 0
else     
    if [ "$swReopUrl" == "$targetUrl" ];then
        echo "SoftwareRepoURLL is correct."
        echo "No action."
        exit 1
    else
        echo "SoftwareRepoURL need updated."
        echo "Let's configure it."
        exit 0
    fi
fi