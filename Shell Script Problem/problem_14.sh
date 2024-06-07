#!/bin/bash
#14. Write a Shell program to find the sum of the numbers passed as parameters.
sum_numbers() {
    sum=0
    for num in "$@"; do
        ((sum += num))
    done
    echo "Sum of numbers: $sum"
}

# Example: Sum of 3, 5, and 7
sum_numbers 3 5 7
