#!/bin/bash

ID=$(id -u)

if [ $ID != 0 ]
then
 echo "Error: Please run as root user"
 exit 1 # You can give other than 0
else 
 echo "Successful: You are a root user"
fi #Reverse of if indicates ending of condition.
#Shell script won't stop if it faces errors, all other languages will stop. 
#So we use exit status command to check previous command is success or not.
#Shell script will store the command output in exit status and Command for exit status is $?

yum install mysql -y

if [ $? = 0 ]
then
   echo "The installation is successful"
else
   echo "The installation is failed"
   exit 1
fi

yum install git -y

if [ $? -ne 0 ]
then
   echo "The installation is failed"
   exit 1
else
   echo "The installation is successful"
fi

#The above repeated code can be reduced using functions.
