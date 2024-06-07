#!/bin/bash
printf "IF ELSE STATEMENT\n"
read -p "enter Year: " Year

if [ $(($Year % 4)) -eq 0 ] && [ $(($Year % 100)) -ne 0 ]  || [ $(($Year % 400)) -eq 0 ]

then
echo "Leap Year"
else
echo " Not Leap Year"
fi