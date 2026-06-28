#!/bin/bash


if [ $($UID) -eq 100 ]; then
    echo "Root user is running script"
else
    echo "User is not root"
fi