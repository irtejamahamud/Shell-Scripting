#!/bin/bash

max=25
nb=0
nf=0

declare -a frag=()  # Fragmentation array
declare -a b=()     # Blocks array
declare -a f=()     # Files array
declare -a bf=()    # Block flags array
declare -a ff=()    # File allocation array

# Initialize arrays to zero
for ((i = 1; i <= max; i++)); do
    b[$i]=0
    f[$i]=0
    frag[$i]=0
    bf[$i]=0
    ff[$i]=0
done

read -p "Enter the number of Blocks: " nb
read -p "Enter the number of Files: " nf

echo -e "\nEnter size of the blocks:-"
for ((i = 1; i <= nb; i++)); do
    read -p "Block-$i: " size
    b[$i]=$size
done

echo -e "\nEnter size of the files:-"
for ((i = 1; i <= nf; i++)); do
    read -p "File-$i: " size
    f[$i]=$size
done

for ((i = 1; i <= nf; i++)); do
    for ((j = 1; j <= nb; j++)); do
        if [[ ${bf[$j]} -ne 1 && ${b[$j]} -ge ${f[$i]} ]]; then
            ff[$i]=$j
            frag[$i]=$((${b[$j]} - ${f[$i]}))
            bf[$j]=1
            break
        fi
    done
done

echo -e "\nFile_no \tFile_size \tBlock_no \tBlock_size \tFragment"
for ((i = 1; i <= nf; i++)); do
    echo -e "$i\t\t${f[$i]}\t\t${ff[$i]}\t\t${b[${ff[$i]}]}\t\t${frag[$i]}"
done
