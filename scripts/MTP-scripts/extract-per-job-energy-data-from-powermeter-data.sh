#!/bin/bash

#Usage : 

powerMeterData=$1
job-start-end-time-data=$2
blockSize=$3
specFlag=$4

while IFS=' ' read -r fileSize startTime endTime
do 

	outputFile="../experiment-data/terasort-$fileSize-GB-$blockSize-block-spec-$specFlag-mapred-8-task/terasort-$fileSize-GB-$blockSize-block-spec-$specFlag-mapred-8-task-energy"

	python chop-energy-data.py $startTime $endTime $powerMeterData $outputFile

done < $job-start-end-time-data
