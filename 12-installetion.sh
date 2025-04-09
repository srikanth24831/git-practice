!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

if [ $USERID -ne 0 ]
then
     echo "please run this script with root priveleges"
     exit 1
fi

dnf installed git

if [ $? -ne 0 ]
then

      echo "git is not installed going to install it.."
      dnf install git -y
else

        echo "git is already installed nothing to do.."
fi