#!/bin/bash

# Function to count alphabets, digits, and special characters
count_characters() {
    input_string="$1"
    alphabets=$(echo -n "$input_string" | tr -cd '[:alpha:]' | wc -m)
    digits=$(echo -n "$input_string" | tr -cd '[:digit:]' | wc -m)
    special_chars=$(echo -n "$input_string" | tr -cd '[:punct:][:space:]' | wc -m)

    echo "Alphabets = $alphabets"
    echo "Digits = $digits"
    echo "Special characters = $special_chars"
}

# Main program
read -p "Enter a string: " input_string

count_characters "$input_string"
