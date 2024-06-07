#! /bin/bash
# 7. Find the Smallest digit from the Number.
#!/bin/bash

read -p "Enter the number of terms: " n

largest=0
second_largest=0

while (($n != 0)); do
    digit=$((n%10))
    if ((digit > largest)); then
        ((second_largest = $largest))
        ((largest = $digit))
    elif ((digit > second_largest)) && ((digit < largest)); then
       (( second_largest = $digit))
    fi

    n=$((n / 10))
done

echo "Second Largest number: $second_largest"
