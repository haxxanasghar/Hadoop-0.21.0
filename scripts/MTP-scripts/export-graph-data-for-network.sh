#!/bin/bash

blockSize=$1
specFlag=$2 #on/off
mapredTask=$3

currentDir="/usr/local/hadoop/scripts/MTP-scripts"
outputFile="$currentDir/network-consumption/network-consumption-spec-$specFlag-5gb-50gb-blocksize-$blockSize-mapred-$mapredTask-task"
rm $outputFile

touch $outputFile

printf "Workload-Size\tSpec-$specFlag-BlockSize-$blockSize\n" >> $outputFile

pushd "../experiment-data"

for (( i=5; i <= 50; i=i+5))
do
	column1Dir="terasort-$i-GB-$blockSize-block-spec-$specFlag-mapred-$mapredTask-task"

	#printf "$i\t" >> $outputFile

	pushd $column1Dir	

	#collected data in MB
	collectedData=`cat $column1Dir-network-slave* | awk 'BEGIN{send=0.0; recv=0.0} {send += $1; recv += $2} END{ printf("%f\t%f",send/1024,recv/1024); }'`
	
	printf "$i\t$collectedData\n" >> $outputFile

	popd

done

popd
