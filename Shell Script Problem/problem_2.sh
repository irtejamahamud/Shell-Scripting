#! /bin/bash
#2. Write a Shell program to find the smallest number from a set of numbers.

read -p "Enter numbers using space if you input multiple input: " nums

ifs=' ' read -ra arr <<<"$nums"
smallest=${arr[0]}
for n in "${arr[@]}";do
    if ((n < smallest )); then
        smallest=$n
    fi       
done
echo "Smallest Number:$smallest"
