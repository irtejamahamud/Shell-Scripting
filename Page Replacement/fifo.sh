pageFaultCount=0
memory=()
memoryIndex=0

echo "Enter number of pages:"
read numberOfPages

echo "Enter the pages:"
for ((i=0; i<numberOfPages; i++)); do
    read -r pages[$i]
done

echo "Enter number of frames:"
read numberOfFrames

for ((i=0; i<numberOfFrames; i++)); do
    memory[$i]=-1
done

echo "The Page Replacement Process is -->"
for ((i=0; i<numberOfPages; i++)); do
    for ((j=0; j<numberOfFrames; j++)); do
        if [[ ${memory[$j]} -eq ${pages[$i]} ]]; then
            break
        fi
    done
    if [[ $j -eq $numberOfFrames ]]; then
        memory[$memoryIndex]=${pages[$i]}
        ((memoryIndex++))
        ((pageFaultCount++))
    fi
    for ((k=0; k<numberOfFrames; k++)); do
        printf "\t%s" "${memory[$k]}"
    done
    if [[ $j -eq $numberOfFrames ]]; then
        printf "\tPage Fault No: %d" $pageFaultCount
    fi
    echo ""
    if [[ $memoryIndex -eq $numberOfFrames ]]; then
        memoryIndex=0
    fi
done
echo "The number of Page Faults using FIFO is: $pageFaultCount"
fifo.sh
Displaying fifo.sh.
Lab 8
Abdullah Al Farhad
•
25 May
100 points

OS_Lab_Ex_08.pdf
PDF
Class comments