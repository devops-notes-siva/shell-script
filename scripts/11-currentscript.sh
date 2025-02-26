#!/bin/bash

echo "This from current script"
course=devops-current
echo "this varaible is from current $course"

sh 12-otherscript.sh

echo "This from current script"
echo "this varaible is from current $course"