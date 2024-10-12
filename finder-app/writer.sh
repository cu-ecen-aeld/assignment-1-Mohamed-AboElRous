#!/bin/sh

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path_to_file> <write_string>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Attempt to write the string to the specified file, overwriting any existing file
if echo "$writestr" > "$writefile"; then
    echo "File created successfully: $writefile"
else
    echo "Error: Could not create file $writefile."
    exit 1
fi

exit 0
