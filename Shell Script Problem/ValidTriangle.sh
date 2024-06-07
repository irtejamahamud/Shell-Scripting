#! /bin/bash
#2. Write a Shell program to Check Triangle is Valid or Not?
read -p "enter side a: " a
read -p "enter side b: " b
read -p "enter side c: " c
if [[ $(( $a+$b )) -gt $c  &&  $(( $b+$c )) -gt $a && $(( $c+$a )) -gt $b ]]; then
    
        echo " This is a valid Triangle $a , $b and $c"
    else 
        echo " This is not a valid Triangle $a , $b and $c"
    fi