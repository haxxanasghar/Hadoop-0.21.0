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
outputFile="$currentDir/network-consumption/network-consumption-$workload-$startSize-GB-$endSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"
rm $outputFile

touch $outputFile

printf "Workload-Size\t$straggler-straggler-spec-$specFlag-aggressiveness-$aggre\n" >> $outputFile

pushd "../experiment-data"

for (( i=$startSize; i <= $endSize; i=i+$inc))
do
	column1Dir="$workload-$i-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"

	#printf "$i\t" >> $outputFile

	pushd $column1Dir	

	#collected data in MB
	collectedData=`cat $column1Dir-network-slave* | awk 'BEGIN{send=0.0; recv=0.0} {send += $1; recv += $2} END{ printf("%f\t%f",send/1024,recv/1024); }'`
	
	printf "$i\t$collectedData\n" >> $outputFile

	popd

done

popd
