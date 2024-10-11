#!/bin/bash

# a. Finding files containing "sample" and at least 3 occurrences of "CSC510"
#

# Part A: Filter files with "sample" and "CSC510" occurrences
grep -c "sample" dataset1/file* | 
grep -E ":[1-9]+[0-9]*$" |  # Only keep files with at least 1 "sample"
cut -d: -f1 |               # Extract the file name
xargs grep -o "CSC510" |     # Search for "CSC510" in the filtered files
sort |                       # Sort the occurrences
uniq -c |                    # Count unique occurrences
grep -E -v "^\s*[1-2]" |     # Exclude files with 1-2 occurrences
cut -d: -f1 |                # Extract file names again

# Part B: List and sort the filtered files
awk '{ print $1, $2 }' |     # Separate the count and filename
while read count file; do
    ls -l "$file" | awk -v count="$count" '{print count, $0}'   # Add count to each file's details
done | 
sort -k1,1nr -k5,5nr |       # Sort by count first, then by file size (5th column)
awk '{print $10}' |           # Print the file name (9th field from `ls -l`)
cut -d/ -f2 |                # Extract just the file name (if path is present)

# Part C: Replace "file" with "filtered"
sed 's/file/filtered/g'      # Replace "file" with "filtered"

