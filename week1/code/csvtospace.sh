#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Error: Wrong number of input arguments."
  echo "Usage: $0 <csv-file>"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

output_file="${1%.*}.txt"

# Optional: Check if output file already exists
if [ -f "$output_file" ]; then
  echo "Warning: Output file '$output_file' already exists. Overwrite? (y/n)"
  read overwrite
  if [ "$overwrite" != "y" ]; then
    echo "Conversion cancelled."
    exit 1
  fi
fi

# Convert comma separated values to space separated values and write to output file
sed 's/,/ /g' "$1" > "$output_file" 
mv "$output_file" ../results/
echo "CSV file '$1' converted to space separated values and saved as '../results/$(basename "$output_file")'."
