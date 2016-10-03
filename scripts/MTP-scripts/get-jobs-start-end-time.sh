#!/bin/bash

workload=$1  #terasort/wordcount
blockSize=$2
straggler=$3 #with/without     
specFlag=$4  #off/on-with-original/on-without-origina
aggre=$5     #no/low/medium/high

startSize=$6
endSize=$7
inc=$8

currentDir="/usr/local/hadoop/scripts/MTP-scripts"
outputFile=$currentDir/jobs-start-end-time/jobs-start-end-time-$workload-$startSize-GB-$endSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre
rm $outputFile

touch $outputFile

pushd "../experiment-data"

for (( i=$startSize; i <= $endSize; i=i+$inc))
do
	column1Dir="$workload-$i-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"

	pushd $column1Dir	
	startTime=`cat $column1Dir | head -n 1 | awk 'END{print $2}'`
	endTime=`cat $column1Dir | head -n 10 | tail -n 1 | awk 'END{print $2}'`
	printf "$i $startTime $endTime\n"  >> $outputFile
	popd

done

popd
