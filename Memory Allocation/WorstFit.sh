# #!/bin/bash

# declare -a b=()  # Array to store block sizes
# declare -a f=()  # Array to store file sizes
# declare -a bf=()  # Array to store block flags
# declare -a ff=()  # Array to store file allocations
# declare -a frag=()  # Array to store fragmentation

# read -p "Enter the number of blocks: " nb

# echo -e "\nEnter Size of Each block:"
# for ((i = 0; i < nb; i++)); do
#     read -p "Enter Size-$i: " size
#     b[$i]=$size
#     bf[$i]=0  # Initialize block flags
# done

# read -p "Enter the number of files: " nf

# echo -e "\nEnter Size of Each file:"
# for ((i = 0; i < nf; i++)); do
#     read -p "Enter Size-$i: " size
#     f[$i]=$size
# done

# max=0
# for ((i = 0; i < nf; i++)); do
#     for ((j = 0; j < nb; j++)); do
#         if [[ ${bf[$j]} -eq 0 ]]; then
#             temp=$((b[$j] - f[$i]))
#             if [[ $temp -ge 0 ]]; then
#                 if [[ $temp -gt $max ]]; then
#                     max=$temp
#                     ff[$i]=$j
#                 fi
#             fi
#         fi
#     done
#     frag[$i]=$max
#     bf[${ff[$i]}]=1
#     max=0
# done

# echo -e "\nFile_no \tFile_size \tBlock_no \tBlock_size \tFragment"
# for ((i = 0; i < nf; i++)); do
#     echo -e "$i\t\t${f[$i]}\t\t${ff[$i]}\t\t${b[${ff[$i]}]}\t\t${frag[$i]}"
# done

# My own Code
#!/bin/bash
declare -a bf=()
declare -a ff=()
declare -a frag=()
for (( i=0; i<10; i++ )); do
    bf[i]=0
    ff[i]=0
    frag[i]=0
done

echo -n "Enter numbers of Blocks: "
read block
for (( i=0; i<block; i++ )); do
    echo -n "block size-$((i)):"
    read bs[$i]
done

echo -n "Enter the numbers of files: "
read file
for (( i=0; i<file; i++ )); do
    echo -n "file size-$((i)):"
    read fs[$i]
done
max=0
temp=0
for (( i=0; i<file; i++ )); do 
    for (( j=0; j<block; j++ )); do
        if (( bf[j] != 1 )); then 
            temp=$(( bs[j]-fs[i] ))
           if (( temp >= 0 )); then 
                if (( max < temp )); then 
                    max=$temp
                    ff[i]=$j
                fi
            fi
        fi
    done 
    frag[i]=$max
    bf[ff[i]]=1
    max=0
done 
 echo -e "\nFile_no\tFile_Size\tBlock_no\tBlock_Size\tFragmentation"
for (( i=0; i<file; i++ )); do
    echo -e "$i\t\t${fs[i]}\t\t${ff[i]}\t\t${bs[ff[i]]}\t\t${frag[i]}"
done 












