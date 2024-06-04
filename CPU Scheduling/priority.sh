#!/bin/bash
declare -a bt=()
declare -a p=()
declare -a wt=()
declare -a tat=()
declare -a pt=()
avgWt=0
avgTat=0

echo -n "Enter the number of Jobs: "
read n

for ((i=0;i<n;i++))
do
    p[$i]=$(($i+1))
    echo -n "Enter Burst time for Job $((i+1)): "
    read bt[$i]
    echo -n "Enter the Priority Level: "
    read pt[$i]
done

echo -e "\nShort Job First Method Apply: "
for ((i=0;i<n;i++))
do
    for ((j=i+1;j<n;j++))
    do
        if  ((${pt[$i]} > ${pt[$j]})) 
        then
            
            
            tmp=${pt[$i]}
            pt[$i]=${pt[$j]}
            pt[$j]=$tmp
            
            tmp=${bt[$i]}
            bt[$i]=${bt[$j]}
            bt[$j]=$tmp

            tmp=${p[$i]}
            p[$i]=${p[$j]}
            p[$j]=$tmp
        fi
    done
done

wt[0]=0
tat[0]=${bt[0]}
for ((i=1;i<n;i++))
do
    wt[$i]=${tat[$((i-1))]}
    tat[$i]=$((bt[$i]+wt[$i]))
    avgWt=$(echo "scale=2; $avgWt + ${wt[$i]}" | bc)
    avgTat=$(echo "scale=2; $avgTat + ${tat[$i]}" | bc)
done

avgWt=$(echo "scale=2; $avgWt / $n" | bc)
avgTat=$(echo "scale=2; $avgTat / $n" | bc)

echo -e "\nProcessor\tburst_time\tPriority\tTurn_around_time\tWaiting_Time"
for ((i=0;i<n;i++))
do
    echo -e "P${p[$i]}\t\t${bt[$i]}\t\t${pt[$i]}\t\t${tat[$i]}\t\t\t${wt[$i]}"
done

echo -e "\nAverage Waiting Time: $avgWt"
echo -e "Average Turn Around Time: $avgTat"