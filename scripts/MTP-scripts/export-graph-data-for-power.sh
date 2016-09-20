#!/bin/bash

blockSize=$1
specFlag=$2 #on/off
mapredTask=$3

currentDir="/usr/local/hadoop/scripts/MTP-scripts"
outputFile="$currentDir/power-consumption/power-consumption-spec-$specFlag-5gb-50gb-blocksize-$blockSize-mapred-$mapredTask-task"
rm $outputFile

touch $outputFile

printf "Workload-Size\tSpec-$specFlag-BlockSize-$blockSize\n" >> $outputFile

pushd "../experiment-data"

for (( i=5; i <= 50; i=i+5))
do
	column1Dir="terasort-$i-GB-$blockSize-block-spec-$specFlag-mapred-$mapredTask-task"

	printf "$i\t" >> $outputFile

	pushd $column1Dir	
	printf `cat $column1Dir-energy | awk 'BEGIN{PowerSum=0.0;} {PowerSum += $2;} END{ if(NR > 0) print PowerSum/NR;}'` >> $outputFile
	printf "\n" >> $outputFile
	popd

done

popd
