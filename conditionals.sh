#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]; then
    echo "Given number is greater than 20"
elif [ $NUMBER -eq 20 ]; then
    echo "Given number is equal to 20"
else
    echo "Given number is less than 20"

fi


USERNAME=$(($USER))
PACKAGE=$2
echo "User name is : $USERNAME"
USERID=$((id USERNAME))
if [ $USERID -eq 0 ]; then
    echo "User is root user"
    dnf install $2
else
    echo "User is not root user, switch to root user and then execute this script again"
fi