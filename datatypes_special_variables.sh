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