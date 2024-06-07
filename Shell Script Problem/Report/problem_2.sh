#!/bin/bash
# Function to count occurrences of each digit in a number
count_digits() {
    number=$1
    declare -A counts

    while [ $number -gt 0 ]
    do
        digit=$(( $number % 10 ))
        if [ ${counts[$digit]+_} ]
        then
            counts[$digit]=$(( ${counts[$digit]} + 1 ))
        else
            counts[$digit]=1
        fi
        number=$(( $number / 10 ))
    done

    for digit in {0..9}
    do
        if [ ${counts[$digit]+_} ]
        then
            echo "$digit = ${counts[$digit]} times"
        fi
    done
}

# Main program
read -p "Enter the number: " input_number

if ! [[ $input_number =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
fi

count_digits $input_number
