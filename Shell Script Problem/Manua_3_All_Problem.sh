1. Even and Odd Check?
#! /bin/bash
read -p "enter number: " a
read -p "enter number: " b
if [[ $a%2==0  &&   $b%2==0 ]]; then #if ( (a+b) && () )
    
        echo " $a and $b is the Even Number"
    else mc
39        echo " $a and $b is the Odd Number"
    fi
2. Write a Shell program to Check Triangle is Valid or Not?
#! /bin/bash
read -p "enter number: " a
read -p "enter number: " b
read -p "enter number: " c
if [[ $(( $a+$b )) -gt $c  &&  $(( $b+$c )) -gt $a && $(( $c+$a )) -gt $b ]]; then #if ( (a+b) && () )
    
        echo " This is a valid Triangle $a , $b and $c"
    else 
        echo " This is not a valid Triangle $a , $b and $c"
    fi
3.Write a Shell program to find the sum of odd and even numbers from a set of numbers.
#! /bin/bash
odd=0
even=0

for n in 4 3 6 7 2 5; do
    if (($n % 2 == 0)); then
        ((even += n))
    else
        ((odd += n))
    fi
done

echo Sum odd is:$odd
echo Sum even is:$even
4. Find Then maximum Element from the Array ?
#!/bin/bash

read -p "Enter numbers (separated by spaces): " numbers

IFS=' ' read -ra num_array <<< "$numbers"

largest=${num_array[0]}

for num in "${num_array[@]}"; do
    if ((num > largest)); then
        largest=$num
    fi
done

echo "Largest element: $largest"

5. Find Then minimum Element from the Array ?
#!/bin/bash

read -p "Enter numbers (separated by spaces): " numbers

IFS=' ' read -ra num_array <<< "$numbers"

min=${num_array[0]}

for num in "${num_array[@]}"; do
    if ((num < min)); then
        min=$num
    fi
done

echo "Lowest element: $min"



