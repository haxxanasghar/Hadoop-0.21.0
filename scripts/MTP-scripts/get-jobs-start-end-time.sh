#!/bin/bash

blockSize=$1
specflag=$2 #usage specflag=on
mapredTask=$3

currentDir="/usr/local/hadoop/scripts/MTP-scripts"
outputFile=$currentDir/jobs-start-end-time/jobs-start-end-time-spec-$specflag-5gb-50gb-blocksize-$blockSize-mapred-$mapredTask-task
rm $outputFile

touch $outputFile

pushd "../experiment-data"

for (( i=5; i <= 50; i=i+5))
do
	column1Dir="terasort-$i-GB-$blockSize-block-spec-$specflag-mapred-$mapredTask-task"

	pushd $column1Dir	
	startTime=`cat $column1Dir | head -n 1 | awk 'END{print $2}'`
	endTime=`cat $column1Dir | head -n 10 | tail -n 1 | awk 'END{print $2}'`
	printf "$i $startTime $endTime\n"  >> $outputFile
	popd

done

popd
