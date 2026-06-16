#!/bin/bash


echo "Please enter username : "
read USER_NAME
echo "You have enetered user name as $USER_NAME"

echo "Please enter your password here:"
read -s PASSWORD
echo "You have enetered password as $PASSWORD"


#execution time
TIMESTAMP1=$(date +%s)
sleep 10
TIMESTAMP2=$(date +%s)
echo "execution time is $((TIMESTAMP2-TIMESTAMP1))"

