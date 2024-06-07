#!/bin/bash
#13. Write a Shell program to find the largest number between two numbers using function.
find_largest() {
    if [ $1 -gt $2 ]; then
        echo "Largest number: $1"
    else
        echo "Largest number: $2"
    fi
}

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

find_largest $num1 $num2
