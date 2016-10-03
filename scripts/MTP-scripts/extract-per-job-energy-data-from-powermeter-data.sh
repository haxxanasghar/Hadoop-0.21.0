#!/bin/bash

#Usage : 

powerMeterData=$1
workload=$2  #terasort/wordcount
blockSize=$3
straggler=$4 #with/without     
specFlag=$5  #off/on-with-original/on-without-origina
aggre=$6     #no/low/medium/high

startSize=$7
endSize=$8
inc=$9

jobStartEndTimeData="jobs-start-end-time/jobs-start-end-time-$workload-$startSize-GB-$endSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"

while IFS=' ' read -r fileSize startTime endTime
do 
	experimentFolder="$workload-$fileSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"
	outputFile="../experiment-data/$experimentFolder/$experimentFolder-energy"

	python chop-energy-data.py $startTime $endTime $powerMeterData $outputFile

done < $jobStartEndTimeData
