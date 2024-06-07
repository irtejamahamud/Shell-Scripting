#!/bin/bash

# Function to calculate factorial
factorial() {
    num=$1
    fact=1

    for ((i=1; i<=$num; i++))
    do
        fact=$(( $fact * $i ))
    done

    echo $fact
}

# Main program
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

fact1=$(factorial $num1)
fact2=$(factorial $num2)

echo "Factorial of $num1 is $fact1"
echo "Factorial of $num2 is $fact2"

sum=$(( $fact1 + $fact2 ))

echo "Sum of $fact1 and $fact2 is $sum"
