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
outputFile="$currentDir/memory-consumption/memory-consumption-$workload-$startSize-GB-$endSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"
rm $outputFile

touch $outputFile

printf "Workload-Size\t$straggler-straggler-spec-$specFlag-aggressiveness-$aggre\n" >> $outputFile

pushd "../experiment-data"

for (( i=$startSize; i <= $endSize; i=i+$inc))
do
	column1Dir="$workload-$i-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"


	pushd $column1Dir	

	collectedData=`cat $column1Dir-cpu-mem-slave* | awk 'BEGIN{memory=0.0} {memory += $2} END{ printf("%f", memory/(5*1024)); }'`
	
	printf "$i\t$collectedData\n" >> $outputFile

	popd

done

popd
