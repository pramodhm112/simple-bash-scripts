#!/usr/bin/env bash

for ((i = 32; i >= 0; i--)); do
	r=$((2 ** i))		# multiplying with mutiple of 2 as digits increase
	Probablity+=($r)	
done

[[ $# -eq 0 ]] && {
	echo -e "Usage \n \t $0 numbers"	# condition to check if the number is zero
	exit 1
}

echo -en "Decimal\t\tBinary\n"
for input_int; do	# convertion of decimal to binary number
	s=0
	test ${#input_int} -gt 11 && {		# condition to check for digits
		echo "Support Upto 10 Digit number :: skiping \"$input_int\"" # Supports upto 10 digit number for conversion
		continue
	}

	printf "%-10s\t" "$input_int"

	for n in ${Probablity[@]}; do	# for loop to convet decimal to binary

		if [[ $input_int -lt $n ]]; then	# condition to check for digits
			[[ $s == 1 ]] && printf "%d" 0
		else
			echo -n 1
			s=1
			input_int=$((input_int - n))	# for each digit subtract the number from power of two to get the binary digit
		fi
	done
	echo -e
done
