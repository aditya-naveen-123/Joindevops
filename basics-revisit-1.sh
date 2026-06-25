#!/bin/bash

NAME="ADITYA"
NAME2="NAVEEN"

echo "User 1 name is $NAME"
echo "User 2 name is $NAME2"

NAME=$1
NAME2=$2

echo "Command line varibales ====================="

echo "User 1 is $NAME"
echo "User 2 is $NAME2"

echo "Please enter your password here : "

read -s PASSWORD
echo "The password you entered is $PASSWORD"

STARTTIME=$(date +%s)
sleep 10
ENDTIME=$(date +%s)
echo "Execution time is (($ENDTIME-$STARTTIME)) "
