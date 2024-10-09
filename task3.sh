#!/bin/zsh

# Define the input file
input_file="titanic.csv"

# Define the output file(s)
output_file_4a="titanic_filtered-4a.csv"
output_file_4b="titanic_modified-4b.csv"

# Question 4(A)

# Write the header to the output file
echo "PassengerId,Survived,Pclass,Name,Sex,Age,SibSp,Parch,Ticket,Fare,Cabin,Embarked" > $output_file_4a

# Extract passengers with Pclass=2 and Embarked='S'
awk -F, '$4 == 2 && $13 == "S" {print $0}' $input_file >> $output_file_4a

# # Display the number of extracted passengers
# echo "Extracted $(wc -l < $output_file_4a) entries (including header) to $output_file_4a"

# Display the first few lines of the output file
echo "\nFirst few lines of the extracted data:"
head -n 5 $output_file_4a


# Question 4(B)

# Displaying first few lines of the dataset
echo "First 5 entries of the original dataset."
head -n 6 $input_file

# Modifying gender entries in the dataset.
awk -F, 'BEGIN {OFS=","}
    NR==1 {print $0}
    NR>1 {
        if ($6 == "male") $6 = "M"
        else if ($6 == "female") $6 = "F"
        print $0
    }' $input_file > $output_file_4b

# Display the modified entries of the dataset.
echo "\nModified Dataset(First 5 entries)."
head -n 6 $output_file_4b

# Question 4(C)

input_file_2="titanic_filtered-4a.csv"

echo "Calculating average age from $input_file_2..."

avg_age=$(awk -F, '
    NR > 1 {  # Skip the header row
        if ($7 != "") {  # Check if age is not empty
            sum += $7
            count++
        }
    }
    END {
        if (count > 0) 
            printf "%.2f", sum / count
        else 
            print "No valid age data found"
    }
' $input_file_2)

echo "Average age: $avg_age"