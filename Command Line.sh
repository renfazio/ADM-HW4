#Q1. What is the most-watched Netflix title?
echo "The most watched netflix title and its watch time is:"
cut -d',' -f2,3 vodclickstream_uk_movies_03.csv | awk -F',' '$1 != 0 && $1 != -1 && $1 != ""' | awk -F',' '{duration[$2] += $1} END {for (title in duration) print title "," duration[title]}' | sort -t',' -k2 -n -r | head -n 1

#Q2. The average time between subsequent clicks on Netflix.com
echo "The average time between subsequent clicks on Netflix.com is:"
awk -F ',' 'NR > 1 {print $3}' vodclickstream_uk_movies_03.csv | awk '{sum += $1} END {print sum / NR}'

#Q3. The ID of the user that has spent the most time on Netflix
echo "The ID of the user that has spent the most time on Netflix is:"
awk -F ',' 'NR > 1 {sum[$NF] += $3} END {for (user in sum) print user, sum[user]}' vodclickstream_uk_movies_03.csv | sort -k2 -nr | head -n 1 | awk '{print $1}'   