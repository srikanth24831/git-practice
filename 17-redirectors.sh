#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%M-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G=\e[32m"
N=\e[0m"
Y=\e[33m"

CHECK_ROOT(){
  if [ $USERID -ne 0 ]
then
   echo -e "$R please run this script with root privilages $N" &>>$LOG_FILE
     exit 1
  fi
}
VALIDATE(){
if [ $1 -ne 0 ]
then
     echo -e "$2 is...$R SUCCESS $N" &>>$LOG_FILE
     exit 1
else
     echo -e "$2 is...$G FAILED $N" &>>$LOG_FILE
fi

}
CHECK_ROOT

for package in $@ # $@ refers to all arguments passed to it
do

    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
    echo "$package is not insstalled going to install it.." &>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    else
         echo "$package is already $Y installed..nothing to do $N" &>>$LOG_FILE
     fi    
    done
