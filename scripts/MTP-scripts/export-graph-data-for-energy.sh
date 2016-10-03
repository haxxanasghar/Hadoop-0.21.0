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
outputFile="$currentDir/energy-consumption/energy-consumption-$workload-$startSize-GB-$endSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"
rm $outputFile

touch $outputFile

printf "Workload-Size\t$straggler-straggler-spec-$specFlag-aggressiveness-$aggre\n" >> $outputFile

pushd "../experiment-data"

for (( i=$startSize; i <= $endSize; i=i+$inc))
do
	column1Dir="$workload-$i-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"

	printf "$i\t" >> $outputFile

	pushd $column1Dir	
	printf `cat $column1Dir-energy | awk 'BEGIN{PowerSum=0.0;} {PowerSum += $2;} END{ print PowerSum/3600;}'` >> $outputFile
	printf "\n" >> $outputFile
	popd

done

popd
