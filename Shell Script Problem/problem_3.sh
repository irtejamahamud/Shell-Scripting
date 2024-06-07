#! /bin/bash
#3. Write a Shell program to find the sum of all numbers between 50 and 100, which are divisible by 3 and not divisible by 5.

sum=0

for (( n=50; n<100; n++ ));do
    if ((n%3==0)) && ((n%5!=0));then
        sum+=$n
    fi 
done
echo "Sum Of the 50 and 100 (divisible by 3 and not divisile by 5):$sum"


