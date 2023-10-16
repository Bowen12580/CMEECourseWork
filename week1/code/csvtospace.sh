#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Error: Wrong number of imput"
  exit 1
fi

if [ ! -r "$1" ] 
then
  echo "Error: Check the file type and name"
  exit 1
fi

output_file="space_$1"

# Convert comma separated values to space separated values and write to output file
sed 's/,/ /g' "$1" > "$output_file" || { echo "Error: Failed to write to output file."; exit 1; }

echo "CSV file '$1' converted to space separated values and saved as '$output_file'."
exit 0
