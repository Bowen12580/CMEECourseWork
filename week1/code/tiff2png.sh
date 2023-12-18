#!/bin/bash

# Check if 'convert' command (ImageMagick) is available
if ! command -v convert &> /dev/null; then
    echo "Error: 'convert' command (ImageMagick) is not installed."
    exit 1
fi

# Check if there are .tif files in the current directory
if ! ls *.tif 1> /dev/null 2>&1; then
    echo "Error: No .tif files found in the current directory."
    exit 1
fi

# Original script functionality
for f in *.tif; do  
    echo "Converting $f"; 
    convert "$f" "$(basename "$f" .tif).png"; 
done

