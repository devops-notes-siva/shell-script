#!/bin/bash

chmod +x common.sh
source ./common.sh

check_user

echo "Please enter DB password:"
read -s mysql_root_password

dnf install mysql-server -y &>>$LOGFILE
validate $? "Installing MySQL Server"

systemctl enable mysqld &>>$LOGFILE
validate $? "Enabling MySQL Server"

systemctl start mysqld &>>$LOGFILE
validate $? "Starting MySQL Server"

# mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# validate $? "Setting up root password"

#Below code will be useful for idempotent nature
mysql -h db.sivakumar.online -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
    validate $? "MySQL Root password Setup"
else
    echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
fi
