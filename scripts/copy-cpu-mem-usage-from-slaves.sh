
ssh hduser@slave1 "pkill calculate; exit;"
ssh hduser@slave2 "pkill calculate; exit;"
ssh hduser@slave3 "pkill calculate; exit;"
ssh hduser@slave4 "pkill calculate; exit;"
ssh hduser@slave5 "pkill calculate; exit;"

echo "finish pkill on all slave"

echo "copying data" 

scp hduser@slave1:/usr/local/hadoop/scripts/$1-cpu-mem-slave1  experiment-data/$1/
scp hduser@slave2:/usr/local/hadoop/scripts/$1-cpu-mem-slave2  experiment-data/$1/
scp hduser@slave3:/usr/local/hadoop/scripts/$1-cpu-mem-slave3  experiment-data/$1/
scp hduser@slave4:/usr/local/hadoop/scripts/$1-cpu-mem-slave4  experiment-data/$1/
scp hduser@slave5:/usr/local/hadoop/scripts/$1-cpu-mem-slave5  experiment-data/$1/
