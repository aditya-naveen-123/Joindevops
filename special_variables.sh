#!/bin/bash

echo "Varibales created are  $@"
echo "Number of varibales passed: $#"
echo "Script name : $0"
echo "Which user is running: $USER"
echo "Directory at which script is running : $PWD"
echo "User's home directory : $HOME"
echo "process ID of the script: $$"
sleep 5 &
echo "Background process ID : $!"
echo "Line number of the script : $LINENO"
echo "Script executed in : $SECONDS seconds"
echo "Random number : $RANDOM"
echo "exit code of the previos command : $?"