#!/bin/bash +x

# usage:
# ./assemble.sh output.bin 0:input1.bin 0x1000:input2.bin

DST=$1

rm -f $DST

for arg in "${@:2}"
do
  IFS=\: read -a fields <<<"$arg"
  SRC=${fields[1]} 
  OFFSET=$((${fields[0]})) 

  dd if=$SRC of=$DST bs=1 seek=$OFFSET conv=notrunc
done
