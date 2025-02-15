#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
 echo "please use sudo acces"
 exit 1
fi

CHECK(){

if [ $1 -ne 0 ]
then
    echo "$2 FAILED"
    exit 1
else
    echo "$2 SUCCESS"
if
}

dnf install mysql -y
CHECK $? "mysqll status - "

dnf install git -y
CHECK $? "GIT status - "