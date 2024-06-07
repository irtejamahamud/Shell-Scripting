#! /bin/bash
# 5. Write a Shell program to find the factorial of a number using for loop.
read -p "Enter a number: " num

factorial=1

for ((i = 1; i <= num; i++)); do
    ((factorial *= i))
done

echo "Factorial of $num: $factorial"

