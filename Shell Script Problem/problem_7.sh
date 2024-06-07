#! /bin/bash
# 7. Find the Smallest digit from the Number.
#!/bin/bash

read -p "Enter the number of terms: " n

Smallest=$n

while (($n!=0));do
    digit=$((n%10))

    if ((digit<Smallest));then
        ((Smallest=$digit))
    fi 
    n=$((n/10))
done

echo Smallest Digit:$Smallest



