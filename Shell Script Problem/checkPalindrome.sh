
#!/bin/bash

echo -n "Enter a: "
read a 

temp=$a
pal=""

while (( $a > 0 )); do

        rim=$(( $a % 10 ))
        a=$(( $a / 10 ))
        pal=$(( $pal$rim ))
    done 

    if(( $temp == $pal )); then 
        echo "Number is Palindrom $pal"
    else 
        echo "Not a palindrom $pal"
    fi
echo "$temp"

# String check palindrome or not
#!/bin/bash

isPalindrome() {
    local s=$1
    local len=${#s}
    for (( i=0; i<len/2; i++ )); do
        if [[ ${s:i:1} != ${s:len-i-1:1} ]]; then
            return 1 # false
        fi
    done
    return 0 # true
}

echo "Enter words (press Ctrl+D to end input):"

while read -r word; do
    if [[ $word == "exit" ]]; then 
        break
    fi
    isPalindrome "$word"
    if [[ $? -eq 0 ]]; then
        echo -e "\nThis string is palindrome $word\n"
    else
        echo -e "\nThis string is not palindrome $word\n"
    fi
done


