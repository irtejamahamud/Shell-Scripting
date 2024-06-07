#!/bin/bash

# Function to generate Fibonacci series
generate_fibonacci() {
    n=$1
    a=0
    b=1

    # Initialize the array with the first two Fibonacci numbers
    fibonacci[0]=$a
    fibonacci[1]=$b

    for (( i=2; i<n; i++ ))
    do
        fib=$((a + b))
        fibonacci[i]=$fib
        a=$b
        b=$fib
    done
}

# Function to find the second highest and second lowest numbers
find_and_swap() {
    arr=("$@")
    n=${#arr[@]}

    # Sort the array
    sorted=($(printf "%s\n" "${arr[@]}" | sort -n))

    # Find second lowest and second highest
    second_lowest=${sorted[1]}
    second_highest=${sorted[n-2]}

    echo "Fibonacci series: ${arr[@]}"
    echo "2nd highest: $second_highest"
    echo "2nd lowest: $second_lowest"

    # Swap without using any extra variable
    second_lowest=$((second_lowest + second_highest))
    second_highest=$((second_lowest - second_highest))
    second_lowest=$((second_lowest - second_highest))

    echo "After swapping:"
    echo "2nd highest: $second_lowest"
    echo "2nd lowest: $second_highest"
}

# Main script execution
read -p "Enter the number of elements (n >= 4): " num_elements

if ! [[ $num_elements =~ ^[0-9]+$ ]] || [ $num_elements -lt 4 ]; then
    echo "Invalid input. Please enter a valid number (n >= 4)."
    exit 1
fi

declare -a fibonacci

# Generate Fibonacci series
generate_fibonacci $num_elements

# Find second highest and second lowest and swap them
find_and_swap "${fibonacci[@]}"
