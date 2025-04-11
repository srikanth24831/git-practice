#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G=\e[32m"
N=\e[33m"

CHECK_ROOT(){
  if [ $USERID -ne 0 ]
then
   echo "please run this script with root privilages"
     exit 1
  fi
}
VALIDATE(){
if [ $1 -ne 0 ]
then
     echo -e "$2 is...$R SUCCESS $N"
     exit 1
else
     echo -e "$2 is...$G FAILED $N" 
fi

}
CHECK_ROOT

# 15-loops.sh git mysql postfix nginx

for package in $@  # $@ refers to all orguments passed to it
do

    dnf list installed $package
    if [ $? -ne 0 ]
    then
    echo "$package is not insstalled going to install it.."
    dnf install $package -y
    else
         echo "$package is already installed..nothing to do"
     fi    
    done