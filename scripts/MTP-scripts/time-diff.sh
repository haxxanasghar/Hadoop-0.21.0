#!/bin/bash

datainput1=$1
dataoutput=$2
column2Tag=$3

rm $dataoutput

printf "Workload-Size\t$column2Tag\n" >>$dataoutput

IFS=' '

while true
do
	read -r fileSize startTime1 endTime1 <&3 || break
	

	StartDate1=$(date -u -d "$startTime1" +"%s")
        FinalDate1=$(date -u -d "$endTime1" +"%s")
        timeDiff1=$((FinalDate1-StartDate1))

	if [ $timeDiff1 -lt 0 ];then
		timeDiff1=$((86400+timeDiff1))
	fi

	printf $fileSize"\t"$timeDiff1"\n" >> $dataoutput

done 3<$datainput1

