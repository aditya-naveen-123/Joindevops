#!/bin/bash
USERID=$($UID)

if [ $USERID -eq 100 ]; then
    echo "Root user is running script"
else
    echo "User is not root"
fi