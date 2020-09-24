#! /bin/bash

#Get current active user
loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

if [[ "$loggedInUser" == "root" ]]
then
    echo "Login user is root, no action."
    exit 1
fi

#check whether current user is in admin group
res=$(dscl . -read /groups/admin GroupMembership | grep $loggedInUser)
if [[ $res ]]
then
    echo "$loggedInuser is in admin group, need to removed it."
    exit 0
else
    exit 1
fi