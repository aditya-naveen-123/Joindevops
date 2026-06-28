#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user"
    exit 1
fi

# First argument -> what you are installing
# second argument -> exir code
VALIDATE() {
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is failed"
        exit
    else
        echo "Installing $1 is SUCESS"
    fi
}

dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "Package already exists"
    exit 1
else
    echo "Installing MYSQL"
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE MYSQL $?
fi