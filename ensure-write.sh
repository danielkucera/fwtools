#!/bin/bash

IN=$1
OUT=$2

DIFF=""

for i in `seq 0 128`
do
	echo Checking segment $i
	while ! diff <(dd if=$IN bs=1M skip=$i count=1) <(dd if=$OUT bs=1M skip=$i count=1)
	do
		DIFF+=" $i"
		echo Writing segment $i
		dd if=$IN of=$OUT bs=1M skip=$i seek=$i count=1 conv=notrunc
	done
done

echo "Written blocks: $DIFF"
