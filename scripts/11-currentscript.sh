#!/bin/bash

echo "This from current script"
course=devops-current
echo "this varaible is from current $course"
echo  "process id of current scrip is : $$"

sh 12-otherscript.sh


echo "##########################################"
echo "This from current script"
echo "this varaible is from current $course"
echo  "process id of current scrip is : $$"