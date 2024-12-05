#!/bin/bash

#Three colors are available in Linux
#Red - \e[31m
#Green - \e[32m
#Yellow - \e[33m
#Noraml - \e[0m

#Ex:echo -e "Hello I am \e[31m shell script" 
#-e=enable


#!/bin/bash

ID=$(id -u)

echo "script name is $0"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log" #Special variables will work in double quotes "". 

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 = 0 ]
    then 
      echo -e "$2...\e[32m Sucessful \e[0m"    
    else
      echo -e "$2...\e[31m failed \e[0m"
      exit 1
    fi
}

if [ $ID != 0 ]
then
 echo "Error: Pleae run as root user"
 exit 1 # You can give other than 0
else 
 echo "Suessful: You are a root user"
fi

yum install mysql -y &>>$LOGFILE #The output of the command will stored in this file.
VALIDATE $? "Installing mysql" 

yum install git -y &>>$LOGFILE
VALIDATE $? "Installing git"