#!/bin/sh

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path_to_directory> <search_string>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

# Count the number of files in the directory and its subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines that contain the search string
line_count=$(grep -r -c "$searchstr" "$filesdir" | awk '{sum += 1} END {print sum}')

# If no matching lines were found, set line_count to 0
if [ -z "$line_count" ]; then
    line_count=0
fi

# Print the result
echo "The number of files are $file_count and the number of matching lines are $line_count"

exit 0
