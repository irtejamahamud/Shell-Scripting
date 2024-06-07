#!/bin/bash
#18. Write a Shell Program to find the smallest element of an array.
read -p "Enter the number of elements: " num_elements
read -p "Enter numbers (separated by spaces): " numbers

IFS=' ' read -ra arr <<< "$numbers"

smallest=${arr[0]}

for num in "${arr[@]}"; do
     if ((smallest > num));then
        ((smallest=$num))
    fi
done
echo "Smallest Element From the Array:$smallest"
