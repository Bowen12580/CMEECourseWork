#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Error: Wrong number of imput"
  exit 1
fi

if [ ! -r "$1" ] || [ ! -r "$2" ]
then
  echo "Error: Check the file type and name"
  exit 1
fi


cat $1 > $3
cat $2 >> $3
echo "Merged File is"
cat $3
exit 0


# for example use the code below to test
# bash improved_ConcatenateTwoFiles.sh ../sandbox/test.txt ../sandbox/test2.txt ../sandbox/merge.txt

