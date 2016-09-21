#!/bin/bash

blockSize=$1

pushd "experiment-data"

for (( i=5; i <= 50; i=i+5))
do
	column1Dir="terasort-$i-GB-$blockSize-block-spec-off-mapred-6-task"


	pushd $column1Dir	

	rename 's/on/off/' *	

	popd

done

popd
