#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File') #-v will exclude the tmp files system and file name and prints rest
DISK_THRESHOLD=1
message=""

while IFS= read line
do 
 usage=$(echo $line | awk '{print $6}' | cut -d % -f1)  #$6 means disk % , run df -hT and count the line.
 partition=$(echo $line | awk '{print $1F}') #Command to get the disk partition.
 if [ $usage -gt $DISK_THRESHOLD ]
  then 
     message+="High Disk Usage on $partition: $usage<br>"
 fi

done <<< $DISK_USAGE

echo -e "Message: $message"

#echo "$message" | mail -s "High Disk Usage" crazyharee@gmail.com 

sh 20.Mail.sh "Hi Team" "High Disk Usage" "$message" "crazyharee@gmail.com" "Alert Recived On Disk Utilization"


#Monitoring team will monitor Servers, websites. if website is down then they will escalate to DevOps teams.
#If server is down they will escalate to Linux team.