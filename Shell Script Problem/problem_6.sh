# 6. Write a Shell program to generate Fibonacci series.
#!/bin/bash

read -p "Enter the number of terms in Fibonacci series: " n
a=0
b=1

echo "Fibonacci series:"
for ((i = 0; i < n; i++)); do
    echo -n "$a "
    temp=$((a + b))
    a=$b
    b=$temp
done

echo

