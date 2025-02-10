#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is... $G SUCCESS $N"
    fi
}

CHECK_ROOT

# sh 15-loops.sh git mysql postfix nginx
for i in package $@
do 
    dnf list insatalled $package
    if [ $? -ne 0 ]
    then 
        echo " $package not installed.. going to install"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already istalled nothing to do it....
    fi
done