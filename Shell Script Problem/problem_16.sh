#!/bin/bash
#16. Write a Shell program to find the average of n numbers.
read -p "Enter the number of elements: " num_elements

read -p "Enter numbers (separated by spaces): " numbers

IFS=' ' read -ra num_array <<< "$numbers"

sum=0

for num in "${num_array[@]}"; do
    ((sum += num))
done

average=$(bc -l <<< "$sum / $num_elements")

echo "Average of $num_elements numbers: $average"
