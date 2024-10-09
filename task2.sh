#!/bin/bash

# Finding files containing "sample" and at least 3 occurrences of "CSC510"
# Sort by CSC510 occurrences (descending) and file size (descending)

grep -l "sample" dataset1/file_* | 
xargs grep -o "CSC510" | 
sort | 
uniq -c | 
sort -nr | 
sed -n 's/^ *\([0-9]\{1,\}\) \(.*\)/\2 \1/p' | 
grep -E "^.+ [3-9][0-9]*$" | 
gawk '{
    "stat -f %z " $1 | getline size
    print $0, size
}' | 
sort -k2,2nr -k3,3nr | 
gawk '{print $1}' | 
sed 's/.*\///' | 

# Substitute "file_" with "filtered_" in file names
sed 's/file_/filtered_/'