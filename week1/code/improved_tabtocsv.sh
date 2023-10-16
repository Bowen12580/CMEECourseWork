#!/bin/sh
# Author: Your name you.login@imperial.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2019

if [ $# -ne 1 ]
then
    echo "Error: Wrong number of files."
    exit 1
fi

if [ ! -f $1 ]
then
    echo "Error: File '$1' not found."
    exit 1
fi

echo "Creating a comma delimited version of '$1' ..."
cat "$1" | tr -s "\t" "," >> "$1.csv"
echo "Done!"
exit 0


# for example use the code below to test
# bash improved_tabtocsv.sh ../sandbox/test.txt

