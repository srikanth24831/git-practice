#!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

CHECK_ROOT(){
if [ USERID -ne 0 ]
then
     echo "please run this script with root priveleges"
     exit 1
fi

}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
         echo "$2 is...FAILED"
         exit 1
    else
         echo "$2 is...SUCCESS
    fi
}
   CHECK_ROOT

if [ $USERID -ne 0 ]
then
     echo "please run this script with root priveleges"
     exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
 echo "Git is not installed going to install it"
      dnf install git -y
      VALIDATE $? "installing Git"
      else
           echo "git is already installing,nothing to do.."

      fi
        
        dnf list installed mysql
      
      if [ $? -ne 0 ]
      then
        echo "mysql is not installed...going to install"
        dnf install mysql -y
        validate $? "installing mysql"
    else
         echo "mysql is already installed..nothing to do"
fi

  