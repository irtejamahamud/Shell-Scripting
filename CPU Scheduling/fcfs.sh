#!/bin/bash
declare -a bt=()
declare -a p=()
declare -a wt=()
declare -a tat=()
avgWt=0
avgTat=0

echo -n "Enter the numbers of Jobs: "
read n

for ((i=0;i<n;i++))
do
    p[$i]=$(($i+1))
    echo -n "Enter Burst time for Job $((i+1)): "
    read bt[$i]
done

wt[0]=0
tat[0]=${bt[0]}
for ((i=1;i<n;i++))
do
    wt[$i]=${tat[$(($i-1))]}
    tat[$i]=$((bt[$i]+wt[$i]))
    avgWt=$(echo "scale=2; $avgWt + ${wt[$i]}" | bc)
    avgTat=$(echo "scale=2; $avgTat + ${tat[$i]}" | bc)
done

avgWt=$(echo "scale=2; $avgWt / $n" | bc)
avgTat=$(echo "scale=2; $avgTat / $n" | bc)

echo -e "\nProcessor\tburst_time\tTurn_around_time\tWaiting_Time"
for ((i=0;i<n;i++))
do
    echo -e "P${p[$i]}\t\t${bt[$i]}\t\t${tat[$i]}\t\t\t${wt[$i]}"
done

echo -e "\nAverage Waiting Time: $avgWt"
echo -e "Average Turn Around Time: $avgTat"