#String->
#!/bin/bash
read -p "Enter radius: " r

 Area= echo "scale = 2; $r*$r*3.1416"  |bc
 echo $Area


printf "Print the Length of the Any Types:"
pan="Pankaj Mahanto"
echo ${#pan}


joy="Mahanto"

expr index "$pan" "$joy"


start=7
end=14
echo ${pan:$start:$end}
echo ${pan:5:7}

printf "String Replace:\n"
a="This is a string"
echo ${a[@]/is/was}

printf "String Replace all:\n"
a="This is a string"
echo ${a[@]//is/was}

printf "Occurence in starting:\n"
a="This is a string"
echo ${a[@]/#is/was}

printf "Occurence in ending:\n"
a="This is a string"
echo ${a[@]/#is/was}