#!/bin/bash

read -p "Enter student's score: " score

# Function to determine the grade based on the score
get_grade() {
  case $1 in
  9[0-9] | 100)
    echo "Grade: A"
    ;;
  8[0-9])
    echo "Grade: B"
    ;;
  7[0-9])
    echo "Grade: C"
    ;;
  6[0-9])
    echo "Grade: D"
    ;;
  [0-5][0-9])
    echo "Grade: F"
    ;;
  *)
    echo "Invalid score"
    ;;
  esac
}

# Check if the input is a non-negative integer
if [[ $score =~ ^[0-9]+$ ]]; then
  get_grade $score
else
  echo "Invalid input. Please enter a non-negative integer score."
fi

