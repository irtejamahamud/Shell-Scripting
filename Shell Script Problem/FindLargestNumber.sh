#!/bin/bash
printf "Find Largest Number A,B and C\n"

read -p "Enter 1st: " A
read -p "Enter 2nd: " B
read -p "enter 3rd: " C

if [ $A -gt $B ]
then
if [ $A -gt $C ]
then
echo "A=$A is the Largest Number "
else
echo " C=$C is the Largest Number"
fi
else
if [ $B -gt $C ]
then
echo "B=$B is the Largest Number"
else
echo "C=$C is the Largest Number"
fi
fi

