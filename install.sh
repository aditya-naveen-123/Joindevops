#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user"
    exit 1
fi

echo "Installing my SQL"

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "Package already exists"
    exit 1
else
    echo "Installing MYSQL"
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "Installing MYSQL is failed"
        exit
    else
        echo "Installing MYSQL is SUCESS"
    fi
fi