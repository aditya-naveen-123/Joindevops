#!/bin/bash
LOGS_FOLDER="/var/log/roboshop"
sudo mkdir -p $LOGS_FOLDER
sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod 755 $LOGS_FOLDER
LOGS_FILE="$LOGS_FOLDER/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)
 if [ $USERID -ne 0 ]; then
    echo -e "$TIMESTAMP $R [ERROR] Please run this script with root user $N" | tee -a $LOGS_FILE
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$TIMESTAMP $R [ERROR] $2  FAILURE $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$TIMESTAMP $G  $2 ....SUCESS  $N" | tee -a $LOGS_FILE

    fi
}
cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "Adding mongo repo"

dnf install mongodb-org -y &>> $LOGS_FILE

VALIDATE $? "Installing mongoDB"

systemctl enable --now mongod 
VALIDATE $? "Mongo DB Enabled "

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf
VALIDATE $? "Updated traffic from all IPV4"

systemctl restart mongod
VALIDATE $? "Updated IP address so restrting mongodb"
