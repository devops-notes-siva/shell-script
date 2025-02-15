#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
 echo "please use sudo acces"
 exit 1
fi


FILE_NAME=$(echo "$0 | cut -d"." -f1")
TIME_STAMP=$(date +%F-%H-%M-%S)
LOG=/tmp/$FILE_NAME-$TIME_STAMP.log

CHECK(){

if [ $1 -ne 0 ]
then
    echo "$2 FAILED"
    exit 1
else
    echo "$2 SUCCESS"
fi
}

dnf install mysqll -y &>>$LOG
CHECK $? "mysqll status - "

dnf install git -y &>>$LOG
CHECK $? "GIT status - "