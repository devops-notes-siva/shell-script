#!/bin/bash
echo "need to install some packages"
echo "checking user is sudo previliged or not"

ID = $(id -u)

if [ $ID -ne 0]
then
    echo "user does not have previliges to install packages"
    exit 1
fi

dnf install mysq -y

if [ $? -ne 0]
then
    echo "package not installed propely"
    exit 1
else 
    echo "installed propely"
if

echo "final stop"



