#! /bin/bash
12. Write a Shell program to find the largest digit of a number
#!/bin/bash

read -p "Enter the number of terms: " n

Largest=$n

while (($n!=0));do
    digit=$((n%10))

    if ((digit>Largest));then
        ((Largest=$digit))
    fi 
    n=$((n/10))
done

echo Largest Digit:$Largest
