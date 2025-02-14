#!/bin/bash
echo "print all inputs: $@"
echo "total no of input args: $#"
echo "current script name: $0"
echo "present path: $PWD"
echo "current home path: $HOME"
echo "current user executing: $USER"
echo "procceed id running this script: $$"
sleep 60 &
echo "proceed is running sleep command: $!"
echo "hotname ruuning: $HOSTNAME"
echo "proceed is running sleep command: $!"
