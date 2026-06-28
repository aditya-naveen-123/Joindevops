#!/bin/bash
USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "Please run this script with root user"
    exit 1
fi

echo "Installing my SQL"

dnf install mysql -y
 if [ $? -ne 0 ]; then
    echo "Package already exists"
fi