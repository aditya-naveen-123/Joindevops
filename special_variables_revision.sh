#!/bin/bash

echo "All varaibles passed : $@"
echo "Number of variables passed : $#"
echo "Script name : $0"
echo "User running the script: $USER"
echo "Use current wotrking directory : $PWD"
echo "USer home directory: $HOME"
echo "Process intance ID of the ecript run : $$"
sleep 5
echo "PID of the background command : $!"
echo "Line nummber of the script : $LINENO"
echo "Execution time of the script : $SECONDS"
echo " Generate random number : $RANDOM"
echo "Exit code of the previous command : $?"

