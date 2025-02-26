#!/bin/bash

echo "This from other  script"
course=devops-other
echo "this varaible is from current $course"

sh 12-otherscript.sh

echo "This from other script"
echo "this varaible is from current $course"