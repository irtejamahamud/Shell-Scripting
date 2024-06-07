#!/bin/bash
#11. Write a Shell program to find the sum of odd digits and even digits from a number.
read -p "Enter a Numebr: " n
odd=0
even=0
while ((n!=0))
do
    digit=$((n % 10))
    if ((digit%2==0))
then 
    even=$((even+digit))    
else 
    odd=$((odd+digit))    
fi
    n=$((n / 10))
done
echo "Even Sum is:$even"
echo "Odd Sum is:$odd"


