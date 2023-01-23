#!/bin/bash 
# change these per each homework 
#	link to tests:
#	number of tests: 
firsttest="0"
lasttest=57
#	command to execute test: 
command="./hw5 < ./tests/t\$i.in >& ./tests/t\$i.res"
tmpdir="selfcheck_tmp"


if [ ! -f scanner.lex ] 
	then
	echo "File scanner.lex not found!"
	exit
fi

if [ ! -f parser.ypp ] 
	then
	echo "File parser.ypp not found!"
	exit
fi


if [ ! -f makefile ]
	then
		echo "File Makefile not found!"
		exit
fi

make

if [ ! -f hw5 ] 
	then 
	echo "Cannot build submission!" 
	exit 
fi 

i=$firsttest

while [ $i -le $lasttest ] 
	do
	echo -n "Running test $i... "
	./hw5 < ./tests/t$i.in > ./tests/t$i.ll
	lli ./tests/t$i.ll > ./tests/t$i.res
	diff ./tests/t$i.res ./tests/t$i.out &> /dev/null
	if [[ $? != 0 ]] 
		then
			echo "Failed!"
		fi
	if [[ $? == 0 ]]
		then
			echo "[OK]"
		fi
	i=$[$i+1]
done 

echo "Finished tests - GREAT SUCCESS" 
exit
