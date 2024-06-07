#!/bin/bash

# Function to check if the page is in the frame
checkHit() {
    local incomingPage=$1
    shift
    local queue=("$@")
    local occupied=${#queue[@]}
    for ((i=0; i<occupied; i++)); do
        if [[ $incomingPage -eq ${queue[i]} ]]; then
            return 0
        fi
    done
    return 1
}

# Function to print the current frame
printFrame() {
    local queue=("$@")
    for page in "${queue[@]}"; do
        printf "%d\t\t\t" "$page"
    done
}

# Main program starts here
echo -n "Enter the number of pages: "
read n

echo "Enter the reference string: "
read -a incomingStream

echo -n "Enter the number of frames: "
read frames

queue=()
distance=()
occupied=0
pagefault=0
totalPageFault=0

echo -e "The Page Replacement Process is -->\n"
echo -e "\n\t\t\tFrame->1\t\tFrame->2\t\tFrame->3\n"

# Loop over each page in the reference string
for ((i=0; i<n; i++)); do
    echo -e "For ${incomingStream[i]} : \t\t\c"

    if checkHit "${incomingStream[i]}" "${queue[@]}"; then
        printFrame "${queue[@]}"
    elif (( occupied < frames )); then
        queue[occupied]=${incomingStream[i]}
        pagefault=1
        totalPageFault=$((totalPageFault + 1))
        occupied=$((occupied + 1))
        printFrame "${queue[@]}"
    else
        max=-1
        index=-1
        for ((j=0; j<frames; j++)); do
            distance[j]=-1
            for ((k=i-1; k>=0; k--)); do
                if [[ ${queue[j]} -eq ${incomingStream[k]} ]]; then
                    distance[j]=$((i - k))
                    break
                fi
            done
            if (( distance[j] == -1 )); then
                index=$j
                break
            elif (( distance[j] > max )); then
                max=${distance[j]}
                index=$j
            fi
        done
        queue[index]=${incomingStream[i]}
        printFrame "${queue[@]}"
        pagefault=1
        totalPageFault=$((totalPageFault + 1))
    fi

    if (( pagefault == 0 )); then
        echo -e "No page fault!"
    fi

    echo -e "\n"
    pagefault=0
done

echo "Total number of page faults using LRU is: $totalPageFault"



# 7 0 1 2 0 3 0 4 2 3 0 3 2 1 2 0 1 7 0 1
#  page number: 20
#  frame number: 3