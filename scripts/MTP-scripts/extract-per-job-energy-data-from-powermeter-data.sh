#!/bin/bash

#Usage : 

powerMeterData=$1
jobStartEndTimeData=$2
blockSize=$3
specFlag=$4
mapredTask=$5



while IFS=' ' read -r fileSize startTime endTime
do 

	outputFile="../experiment-data/terasort-$fileSize-GB-$blockSize-block-spec-$specFlag-mapred-$mapredTask-task/terasort-$fileSize-GB-$blockSize-block-spec-$specFlag-mapred-$mapredTask-task-energy"

	python chop-energy-data.py $startTime $endTime $powerMeterData $outputFile

done < $jobStartEndTimeData
