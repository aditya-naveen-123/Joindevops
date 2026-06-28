#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user"
    exit 1
fi

# First argument -> what you are installing
# second argument -> exir code
VALIDATE() {
    if [ $2 -ne 0 ]; then
        echo -e $TIMESTAMP "$R [ERROR] Installing $1 is failed $N" | tee -a $LOGS_FILE
        exit
    else
        echo -e $TIMESTAMP "$G [SUCCESS] Installing $1 is SUCESS $N" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -eq 0 ]; then
        echo -e $TIMESTAMP "$Y [INFO] $package already exists... SKIPPING $N" | tee -a $LOGS_FILE
    else
        echo -e $TIMESTAMP "$Y [INFO] Installing Package $package $N"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $package $?
    fi
done

