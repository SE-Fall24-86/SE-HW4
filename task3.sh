grep -E '^([^,]*,[^,]*,2,)' titanic.csv | \
grep ',S' | \
sed 's/female/F/g; s/male/M/g' | \
awk -F, '$7 != "" { sum += $7; count++; print } END { if (count > 0) print "Average Age: " sum / count; }' > task3-output.txt

