#!/bin/bash

set -e

catch_error()
{
    echo "failed at line no  - $1"
    echo "command failed is  - $2"
}

trap 'catch_error ${LINENO} "$BASH_COMMAND"' ERR

user_id=$(id -u)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
DATE=$(date +F%-H%-M%-S%)
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R="\e[31"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



check_user()
{
    
    if [ $user_id -ne 0 ]
    then 
        echo "please execute with super user"
        exit 1
    else
        echo "you are alreday superuser"
    fi
}

# validate()
# {
#     if [ $1 -ne 0 ]
#     then
#         echo -e "$2...$R FAILURE $N"
#         exit 1
#     else
#         echo -e "$2...$G SUCCESS $N"
#     fi
# }