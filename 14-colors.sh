#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G=\e[32m"

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
dnf list installed git
    if [ $1 -ne 0 ]
    then
         echo "Git is not installed, going to install it.."

         dnf install hit -y
         VALDATE $? "installing git"
    else
          echo "Git is already installed nothing to do"
          
    fi

  dnf list installed mysqlsss
  if [ $? -ne 0 ]
  then
       echo "mysql is not installed...going to install"
       dnf install mysqlsss -y
       VALIDATE $? "installing my sql"
 else 
       echo "mysql is already installed..nothing to do"
 fi