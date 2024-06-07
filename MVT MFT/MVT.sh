#!/bin/bash

total_allocated=0
external_fragmentation=0

echo "Enter the total memory available (in Bytes): "
read memory_size

declare -a process_size
i=0

while true; do
    echo "Enter memory required for process $((i + 1)) (in Bytes): "
    read process_size[$i]

    if ((total_allocated + process_size[$i] <= memory_size)); then
        ((total_allocated += process_size[$i]))
        ((i++))
    else
        echo "Memory is Full"
        break
    fi

    echo "Do you want to continue (y/n): "
    read -n 1 choice
    echo

    if [[ $choice != "y" ]]; then
        break
    fi

    if ((i >= 10)); then
        echo "Maximum limit reached (10 processes)"
        break
    fi
done

echo "PROCESS\t\tMEMORY-ALLOCATED"
for ((j = 0; j < i; j++)); do
    echo "$((j + 1))		${process_size[j]}"
done

echo "Total Memory Available: $memory_size"
echo "Total Memory Allocated is $total_allocated"
((external_fragmentation = memory_size - total_allocated))
echo "Total External Fragmentation is $external_fragmentation"

exit 0
