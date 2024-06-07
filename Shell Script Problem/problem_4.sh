#! /bin/bash
#4. Write a Shell program to find the second highest number from a set of numbers.
#!/bin/bash

read -p "Enter numbers (separated by spaces): " numbers

IFS=' ' read -ra num_array <<< "$numbers"

highest=${num_array[0]}
second_highest=${num_array[0]}

for num in "${num_array[@]}"; do
    if ((num > highest)); then
        second_highest=$highest
        highest=$num
    elif ((num > second_highest)) && ((num < highest)); then
        second_highest=$num
    fi
done

echo "Second highest number: $second_highest"