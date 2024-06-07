#! /bin/bash

read -p "Enter Student's Marks: " mark

check_res() {
    case $1 in
    8[0-9] | 100)
        echo "Grade is:A+"
        ;;
    7[5-9])
        echo "Grade is:A"
        ;;
    7[0-5])
        echo "Grade is:A-"
        ;;
    6[5-9])
        echo "Grade is:B+"
        ;;

    6[0-5])
        echo "Grade is:B"
        ;;
    5[5-9])
        echo "Grade is:B-"
        ;;
    5[0-5])
        echo "Grade is:C+"
        ;;
    4[5-9])
        echo "Grade is:C"
        ;;
    4[0-5])
        echo "Grade is:D"
        ;;
    *)
        echo "Your are Fail!"
        ;;
    esac
}

if [[ $mark =~ ^[0-9]+$ ]]; then
    check_res $mark
else
    echo "You Enter Wrong input Try Again!!"
fi
