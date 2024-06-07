read -p "Enter 1st Num: " a
read -p "Enter 2nd Num: " b

let c=$a+$b
echo "Sum=$c"

let d=$a-$b
echo "Subtraction=$d"

let mul=$a*$b
echo "Multiplication=$mul"

let div=$(($a/$b))
echo "Division=$div"