#Find Even and Odd and Finally the value is divisible by $m?

#!/bin/bash
printf "IF ELSE STATEMENT\n"

read -p "enter number: " n

m=10

if [ $(($n % 2)) == 0 ]
then
echo "This number is even"
if [ $(($n % $m)) == 0 ]
then
echo "This Number is Divisible by $m"
else
echo  "This is not Divisible by $m"
fi
else
echo "This is odd Number"
fi