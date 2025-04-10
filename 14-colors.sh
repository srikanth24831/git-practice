#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G=\e[32m"

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
     echo "please run this script with root priveleges"
     exit 1
fi

}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
         echo -e "$2 is...$R FAILED"
         exit 1
    else
          echo "$2 is...SUCCESS
    fi
}
  CHECK_ROOT

  dnf list installed git
  if [ $? -ne 0 ]
  then
       echo "mysql is not installed...going to install"
       dnf install mysql -y
       VALIDATE $? "installing my sql"
 else 
       echo "mysql is already installed..nothing to do"
 fi