#!/bin/bash

blockSize=$1
specFlag=$2 #on/off
mapredTask=$3


currentDir="/usr/local/hadoop/scripts/MTP-scripts"
outputFile="$currentDir/cpu-consumption/cpu-consumption-spec-$specFlag-5gb-50gb-blocksize-$blockSize-mapred-$mapredTask-task"
rm $outputFile

touch $outputFile

printf "Workload-Size\tSpec-$specFlag-BlockSize-$blockSize\n" >> $outputFile

pushd "../experiment-data"

for (( i=5; i <= 50; i=i+5))
do
	column1Dir="terasort-$i-GB-$blockSize-block-spec-$specFlag-mapred-$mapredTask-task"


	pushd $column1Dir	

	collectedData=`cat $column1Dir-cpu-mem-slave* | awk 'BEGIN{cpu=0.0;} {cpu += $1;} END{ printf("%f", cpu/5); }'`
	
	printf "$i\t$collectedData\n" >> $outputFile

	popd

done

popd
