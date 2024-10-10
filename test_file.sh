# # !/bin/zsh

# # define files 
# input_file="titanic.csv"
# output_file="titanic_modified-4b.csv"
# # head=5

# # Displaying first few lines of the dataset
# echo "First 5 entries of the original dataset."
# head -n 6 $input_file

# # Modifying gender entries in the dataset.
# awk -F, 'BEGIN {OFS=","}
#     NR==1 {print $0}
#     NR>1 {
#         if ($6 == "male") $6 = "M"
#         else if ($6 == "female") $6 = "F"
#         print $0
#     }' $input_file > $output_file

# # Display the modified entries of the dataset.
# echo "\nModified Dataset(First 5 entries)."
# head -n 6 $output_file 


# input_file_2="titanic_filtered-4a.csv"

# echo "Calculating average age from $input_file_2..."

# avg_age=$(awk -F, '
#     NR > 1 {  # Skip the header row
#         if ($7 != "") {  # Check if age is not empty
#             sum += $7
#             count++
#         }
#     }
#     END {
#         if (count > 0) 
#             printf "%.2f", sum / count
#         else 
#             print "No valid age data found"
#     }
# ' $input_file_2)

# echo "Average age: $avg_age"


# #!/bin/bash

# # Step 1: Find files containing "sample" and list occurrences of "CSC510"
# grep -l "sample" dataset1/file_* | 
# xargs grep -o "CSC510" | 
# sort | 
# uniq -c | 
# sort -nr | 

# # Step 2: Filter those with at least 3 occurrences of "CSC510"
# sed -n 's/^ *\([0-9]\{1,\}\) \(.*\)/\2 \1/p' | 
# grep -E "^.+ [3-9][0-9]*$" | 

# # Step 3: Change 'file_' to 'filtered_' in the output and print the result
# sed 's/file_/filtered_/' | 
# sed 's/:CSC510.*//'  # This removes the ':CSC510' part to just get the file name


# #!/bin/bash

# # Step 1: Find files containing "sample" and list occurrences of "CSC510"

# # grep -l "sample" dataset1/file_* | while read -r file; do count=$(grep -o "CSC510" "$file" | wc -l); [[ $count -ge 3 ]] && echo "$file"; done | xargs -I {} basename {}
# grep -l "sample" dataset1/file_* | while read -r file; do
#     count=$(grep -o "CSC510" "$file" | wc -l)
#     if [[ $count -ge 3 ]]; then
#         size=$(stat -f %z "$file")
#         printf "%d %d %s\n" $count $size "$file"
#     fi
# done | sort -rn | awk '{print $3}' | xargs -I {} basename {}

# echo "Modified file names and their counts:"
# grep -l "sample" dataset1/file_* | 
# xargs grep -o "CSC510" | 
# sort | 
# uniq -c | 
# sort -nr | 

# # Step 2: Filter those with at least 3 occurrences of "CSC510"
# sed -n 's/^ *\([0-9]\{1,\}\) \(.*\)/\2 \1/p' | 
# grep -E "^.+ [3-9][0-9]*$" | 

# # Step 3: Change 'file_' to 'filtered_' in the file name only
# sed 's/\(.*\/\)file_/\1filtered_/' | 
# sed 's/:CSC510//'


# echo "Original file names and their counts:"
# grep -l "sample" dataset1/file_* | 
# xargs grep -o "CSC510" | 
# sort | 
# uniq -c | 
# sort -nr | 
# sed -n 's/^ *\([0-9]\{1,\}\) \(.*\)/\2 \1/p' | 
# grep -E "^.+ [3-9][0-9]*$" | 
# sed 's/:CSC510//'

# echo -e "\nModified file names and their counts:"
# grep -l "sample" dataset1/file_* | 
# xargs grep -o "CSC510" | 
# sort | 
# uniq -c | 
# sort -nr | 
# sed -n 's/^ *\([0-9]\{1,\}\) \(.*\)/\2 \1/p' | 
# grep -E "^.+ [3-9][0-9]*$" | 
# sed 's/\(.*\/\)file_/\1filtered_/' | 
# sed 's/:CSC510//'
