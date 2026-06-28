#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user"
    exit 1
fi

# First argument -> what you are installing
# second argument -> exir code
VALIDATE() {
    if [ $2 -ne 0 ]; then
        echo $TIMESTAMP "[ERROR] Installing $1 is failed" | tee -a $LOGS_FILE
        exit
    else
        echo $TIMESTAMP "[SUCCESS] Installing $1 is SUCESS" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -eq 0 ]; then
        echo $TIMESTAMP "[INFO} $package already exists... SKIPPING" | tee -a $LOGS_FILE
    else
        echo $TIMESTAMP "[INFO} Installing Package $package"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $package $?
    fi
done

