read -p "Enter the total memory available (in Bytes) " tm
read -p "Enter the block size (in Bytes) " bs
read -p "Enter the number of processes  " np

for (( i=0; i<np; i++ ))
do
  read -p "Enter memory required for process $((i+1)) (in Bytes) " p[$i]
done

nb=$((tm/bs))

for (( i=0; i<nb; i++ ))
do
  b[$i]=0
done

tif=0
echo "PID M_REQ A? IF"
for (( i=0; i<np; i++ ))
do
  for (( j=0; j<nb; j++ ))
  do 
    if [ ${b[$j]} == 0 ] && [ ${p[$i]} -le $bs ]
    then
        echo "$((i+1))   ${p[$i]}   YES   $(( bs - ${p[$i]} ))"
        ((tif+=$(( bs - ${p[$i]})) ))
        b[$j]=1
        break
    fi
  done
  
  if [ $j == $nb ]
    then
        echo "$((i+1))   ${p[$i]}   NO   --"
    fi
done

tef=$((tm-bs*nb))

echo "Total internal fragmentation -- $tif"
echo "Total external fragmentation -- $tef"