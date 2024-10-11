#!/bin/bash

# Part A: Filter files with the string 'sample' and at least 3 occurences of 'CSC510'

grep -c "sample" dataset1/file* | 
grep -E ":[1-9]+[0-9]*$" | 
cut -d: -f1 | 
xargs grep -o "CSC510" | 
uniq -c | 
grep -E -v "^\s*[1-2] dataset1/file" | 
cut -d: -f1 | 

# Part B: Sorting the filtered files in descending order of file size

gawk '{system("ls -l "$2 "| xargs echo "$1 ) }' | 
sort -k1,1nr -k6,6nr | 
gawk '{print $10}' | 
cut -f2 |

# Part C: Modifying the file names from 'file_' to 'filtered_'

sed 's/file/filtered/g'