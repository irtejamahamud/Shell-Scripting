#!/bin/bash

# Function to display numbers at odd positions
display_odd_position_numbers() {
    number=$1
    length=${#number}

    if [ $length -ne 7 ]; then
        echo "Invalid input. Please enter a 7-digit number."
        exit 1
    fi

    for ((i=0; i<length; i+=2))
    do
        echo "${number:i:1}"
    done
}

# Main program
read -p "Enter a 7-digit number: " input_number

if ! [[ $input_number =~ ^[0-9]{7}$ ]]; then
    echo "Invalid input. Please enter a 7-digit number."
    exit 1
fi

display_odd_position_numbers "$input_number"
