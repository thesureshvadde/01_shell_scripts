#!bin/bash

SOURCE_DIR="/tmp/logs"  #logs is the source folder.

#If source directory is not exist print doesn't exist
if [ ! -d $SOURCE_DIR ] # !=Not, -d=directory
then 
   echo "Source directory: $SOURCE_DIR doesn't exits"
fi

FILES_TO_DELETE=$(find /tmp/logs/ -type f -mtime +14 -name "*.log") #To find 14days older files 

while IFS= read -r line #read -r line = To read the deleting file output line by line and IFS=Interal field seperator
do 
 echo "Deleting file: $line"
 rm -rf $line
done <<< $FILES_TO_DELETE #Passing the $FILES_TO_DELETE output as input to while loop. < always denoted the input.


#  we are storing logs in in tmp/logs folder we have to delete 14days old files.
# .log extension files have to deleted not other files.