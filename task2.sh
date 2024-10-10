#!/bin/bash

# a. Finding files containing "sample" and at least 3 occurrences of "CSC510"
echo -e "\nFinding files containing 'sample' and at least 3 occurences of 'CSC510'"
grep -l "sample" dataset1/file_* | 
xargs grep -o "CSC510" | 
sort | 
uniq -c | 
sort -nr | 
sed -n 's/^ *\([0-9]\{1,\}\) \(.*\)/\2 \1/p' | 
grep -E "^.+ [3-9][0-9]*$" | 
sed 's/:CSC510//'
# b. Sorted files by descending file size and CSC510 occurrences.

# c. Modifying files names from 'file_' to 'filtered_'
echo -e "\nModified file names and their counts:"
grep -l "sample" dataset1/file_* | 
xargs grep -o "CSC510" | 
sort | 
uniq -c | 
sort -nr | 
sed -n 's/^ *\([0-9]\{1,\}\) \(.*\)/\2 \1/p' | 
grep -E "^.+ [3-9][0-9]*$" | 
sed 's/\(.*\/\)file_/\1filtered_/' | 
sed 's/:CSC510//'