#!/bin/bash
USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "Root user is running script"
else
    echo "User is not root"
fi