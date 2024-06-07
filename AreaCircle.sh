read -p "Enter the radious: " r
area= echo "scale = 2; $r*$r*3.1416"  |bc
echo $Area

echo "Area: $area"