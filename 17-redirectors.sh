#!/bin/bash

LOGS_FOLDER="/var/log/shell-script" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILES="$LOGS_FOLDER/SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G=\e[32m"
N=\e[0m"
Y=\e[33"

CHECK_ROOT(){
  if [ $USERID -ne 0 ]
then
   echo -e "$R please run this script with root privilages $N" | tee -a &>>$LOG_FILE
     exit 1
  fi
}
VALIDATE(){
if [ $1 -ne 0 ]
then
     echo -e "$2 is...$R FAILED $N" &>>$LOG_FILE
     exit 1
else
     echo -e "$2 is...$G SUCCESS $N" &>>$LOG_FILE
fi
}
USAGE(){
echo -e "$R USAGE:: $N sudo sh 17-redirectors.sh package1 package2..." 
exit1
}

echo "script started executing at: $(date)" >>$LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
     USAGE
fi

for package in $@  # $@ refers to all orguments passed to it
do

    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
    echo "$package is not insstalled going to install it.." | tee -a &>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "installing $package"
    else
         echo "$package is already $Y installed..nothing to do $N" | tee -a &>>$LOG_FILE
     fi    
 done
