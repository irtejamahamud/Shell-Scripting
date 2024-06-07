#! /bin/bash
# 7. Find the Sum of digit from the Number.
#!/bin/bash

read -p "Enter the number of terms: " n

SumOfDigit=0

while (($n!=0));do
    digit=$((n%10))
    ((SumOfDigit+=$digit))

    n=$((n/10))
done

echo Sum of Digit:$SumOfDigit



