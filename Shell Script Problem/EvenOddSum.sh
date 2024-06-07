#! /bin/bash
#1. Write a Shell program to find the sum of odd and even numbers from a set of numbers.
read -p "enter numbers: " nums
sumOdd=0
sumEven=0
ifs=' ' read -ra arr <<<"$nums"
for n in "${arr[@]}"; do
    if ((n % 2 == 0)); then
        ((sumEven += n))
    else
        ((sumOdd += n))
    fi
done
echo "Odd sum=$sumOdd"
echo "Even Sum=$sumEven"
