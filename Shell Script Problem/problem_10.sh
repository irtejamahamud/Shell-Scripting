#!/bin/bash
#Write a Shell program to check the given integer is Armstrong number or not.
read -p "Enter a number: " number
original_number=$number
num_digits=${#number}
sum=0

echo $num_digits
while (($number > 0))
do
    digit=$((number % 10))
    sum=$((sum + digit ** num_digits))
    number=$((number / 10))
done

if (($sum == $original_number)); then
    echo "$original_number is an Armstrong number."
else
    echo "$original_number is not an Armstrong number."
fi
