#! /bin/bash

#remove current user from admin group.

loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')

dseditgroup -o edit -d $loggedInUser -t user admin 

res=$(dscl . -read /groups/admin GroupMembership | grep $loggedInUser)
if [[ $res ]]
then
    echo "$loggedInuser is still in admin group, remove UNSUCCESSFUL."
    exit 1
else
    echo "$loggedInuser is NOT admin group, remove SUCCESSFUL."
    exit 0
fi
