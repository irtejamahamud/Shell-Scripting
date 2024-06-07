#!/bin/bash
printf "Basic Operation\n"
let a=5+9
echo $a

printf "Alternative \n"
let 'b = 5 + 9'

echo $b

let a++
echo $a

print "Expression :\n"
expr 5 + 4

expr 5+4
expr "5 + 9"

d= expr 10 / 5

a=$((3+4))
echo $a

d=$(($a+5))
echo $d