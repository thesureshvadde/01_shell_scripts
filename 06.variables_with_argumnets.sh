#!/bin/bash

#To pass arguments in shell we use special character called "$".
#$1=It reads the First argument
#$2=It reads the Second argument
#We have to give the NAME while executing the shell.
NAME01=$1
NAME02=$2

echo "Conversation between $NAME01 & $NAME02"
echo "$NAME01: Hi $NAME02, How are you?"
echo "$NAME02: Hello $NAME01, I am doing good! How are you?"
echo "$NAME01: I am fine $NAME02"

echo "Script name: $0"
echo "First parameter: $1"
echo "Second parameter: $2"
echo "All parameters: $*"
echo "All parameters: $@"
echo "number of parameters: $#"