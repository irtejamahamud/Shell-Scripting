#!/bin/bash

# Function to find the second highest and third highest numbers
find_second_third() {
    arr=("$@")
    n=${#arr[@]}
    max1=${arr[0]}
    max2=0
    max3=0

    for ((i=1; i<n; i++))
    do
        if [ ${arr[i]} -gt $max1 ]
        then
            max3=$max2
            max2=$max1
            max1=${arr[i]}
        elif [ ${arr[i]} -gt $max2 -a ${arr[i]} -ne $max1 ]
        then
            max3=$max2
            max2=${arr[i]}
        elif [ ${arr[i]} -gt $max3 -a ${arr[i]} -ne $max2 ]
        then
            max3=${arr[i]}
        fi
    done

    echo "The second highest number is: $max2"
    echo "The third highest number is: $max3"

    sum=$(($max2 + $max3))
    echo "The sum of the second and third highest numbers is: $sum"
}

# Main program
read -p "Enter the number of elements: " num_elements

if ! [[ $num_elements =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
fi

declare -a numbers

for ((i=0; i<num_elements; i++))
do
    read -p "Enter the number: " num
    if ! [[ $num =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid number."
        exit 1
    fi
    numbers+=($num)
done

find_second_third "${numbers[@]}"
