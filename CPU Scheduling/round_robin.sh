#!/bin/bash

round_robin_scheduling() {
    local -n processes=$1
    local -n burst_times=$2
    local quantum=$3
    local n=$4

    declare -a remaining_burst_time=("${burst_times[@]}")
    declare -a waiting_time=()
    declare -a turnaround_time=()
    local total_waiting_time=0
    local total_turnaround_time=0
    local time=0

    for ((i=0; i<n; i++)); do
        waiting_time[$i]=0
        turnaround_time[$i]=0
    done

    while true; do
        local done=1
        for ((i=0; i<n; i++)); do
            if (( remaining_burst_time[$i] > 0 )); then
                done=0
                if (( remaining_burst_time[$i] > quantum )); then
                    (( time += quantum ))
                    (( remaining_burst_time[$i] -= quantum ))
                else
                    (( time += remaining_burst_time[$i] ))
                    (( waiting_time[$i] = time - ${burst_times[$i]} ))
                    ((remaining_burst_time[$i]=0))
                fi
            fi
        done

        if (( done == 1 )); then
            break
        fi
    done

    echo -e "\nProcessor\tburst_time\tTurn_around_time\tWaiting_Time"
    for ((i=0; i<n; i++)); do
        (( turnaround_time[$i] = ${burst_times[$i]} + ${waiting_time[$i]} ))
        (( total_waiting_time += ${waiting_time[$i]} ))
        (( total_turnaround_time += ${turnaround_time[$i]} ))
        # printf "Process %d\t Burst Time %d\t Waiting Time %d\t Turnaround Time %d\n" "${processes[$i]}" "${burst_times[$i]}" "${waiting_time[$i]}" "${turnaround_time[$i]}"
        echo -e "P${processes[$i]}\t\t${burst_times[$i]}\t\t${waiting_time[$i]}\t\t${turnaround_time[$i]}"
    done

    printf "\nAverage Waiting Time: %.2f\n" "$(bc -l <<< "scale=2; $total_waiting_time / $n")"
    printf "Average Turnaround Time: %.2f\n" "$(bc -l <<< "scale=2; $total_turnaround_time / $n")"
}

read -p "Enter the number of jobs: " n
declare -a processes
declare -a burst_times
for ((i=0; i<n; i++)); do
    processes[$i]=$(($i+1))
    read -p "Enter Burst time for Job $(($i+1)): " burst_times[$i]
done

quantum=3

echo "Round Robin CPU Scheduling Algorithm:"
round_robin_scheduling processes burst_times $quantum $n