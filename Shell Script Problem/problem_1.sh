#! /bin/bash
#1. Write a Shell program to find the sum of odd and even numbers from a set of numbers.

read -p "Enter numbers using space if you input multiple input: " nums

even=0
odd=0
ifs=' ' read -ra arr <<<"$nums"

for n in "${arr[@]}";do
    if ((n%2 == 0)); then
        ((even+=n))
    else
        ((odd+=n))
    fi
done

echo EvenSum is:$even
echo OddSum is:$odd