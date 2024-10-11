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