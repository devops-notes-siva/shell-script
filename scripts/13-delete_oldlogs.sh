#!/bin/bash
SOURCE_DIRECTORY=/tmp/log-folder

if [ -d $SOURCE_DIRECTORY ]
then
 echo "$SOURCE_DIRECTORY exixts..."
else
 echo "$SOURCE_DIRECTORY does not exixts... "
 exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS=read -r line
do
    echo "deleting file $line"
    rm -rf $line
done <<< $FILES

