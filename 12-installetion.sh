!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

if [ $USERID -ne 0 ]
then
     echo "please run this script with root priveleges"
     exit 1
fi

dnf installed gitttt

if [ $? -ne 0 ]
then

      echo "git is not installed going to install it.."
      dnf install gitttt -y
      fi [ $? -ne 0 ]
      then 
           echo "git installation is not success...check it"
           exit 1
      else echo "git installation is success"
      fi
else

        echo "git is already installed nothing to do.."
fi