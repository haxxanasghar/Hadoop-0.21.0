fileName=$1

hadoop job -list > runningJob

cat runningJob |tail -n 1 | awk '{print $1}' >> $fileName

