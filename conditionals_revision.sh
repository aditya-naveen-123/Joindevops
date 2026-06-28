#!/bin/bash
NUMBER=$1
if [ $NUMBER -gt 20 ]; then
    echo "Number is gretaer than 20"
elif [ $NUMBER -lt 20]; then
    echo "Number is lessthan 20"
else
    echo "Number is equal to 20"
fi