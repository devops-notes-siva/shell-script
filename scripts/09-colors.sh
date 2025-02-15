#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"



ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "Please use sudo access"
    exit 1
fi

FILE=$(echo $0 | cut -d"." -f1)
TIME=$(date +%F-%H-%M)
LOG1=/tmp/$FILE-$TIME.log




VALIDATE() {

if [ $1 -ne 0 ] 
then
    echo -e "$2 $R Failed $N"
    exit 1
else
    echo -e "$2 $G Success $N"
fi

}


dnf install mysql -y &>> $LOG1
VALIDATE $? "mysql status -"

dnf install git -y &>> $LOG1
VALIDATE $? "git status -"

dnf install wgettt -y &>> $LOG1
VALIDATE $? "wget staus -"