#!/bin/bash
#17. Write a Shell Program to find the largest element of an array.
read -p "Enter the number of elements: " num_elements
read -p "Enter numbers (separated by spaces): " numbers

IFS=' ' read -ra arr <<< "$numbers"

largest=${arr[0]}

for num in "${arr[@]}"; do
     if ((largest <num));then
        ((largest=$num))
    fi
done
echo "Largest Element From the Array:$largest"
