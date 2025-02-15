#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



NAME=$(echo $0 | cut -d"." -f1)
TIME=$(date +%F-%H-%M)
LOGFILE=/tmp/$NAME-$DATE.log

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo -e "Please use $G sudo $N previliges"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R FAILED $N"
        exit 1
    else
        echo -e "$2 $G SUCCESS $N"
    fi

}

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i

    if [ $? -eq 0 ]
    then
     echo -e "$i Alreday installed, $R no action required $N"
    else
        echo -e "$i Not  installed, $Y Installing now $N"
        dnf install $i -y &>> $LOGFILE
        VALIDATE $? "$i status-"
    fi

done
