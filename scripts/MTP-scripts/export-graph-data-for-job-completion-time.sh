#!/bin/bash


workload=$1  #terasort/wordcount
blockSize=$2
straggler=$3 #with/without     
specFlag=$4  #off/on-with-original/on-without-origina
aggre=$5     #no/low/medium/high

startSize=$6
endSize=$7
inc=$8


input="jobs-start-end-time/jobs-start-end-time-$workload-$startSize-GB-$endSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"

output="job-completion-time-consumption/job-completion-time-consumption-$workload-$startSize-GB-$endSize-GB-$blockSize-block-$straggler-straggler-spec-$specFlag-aggressiveness-$aggre"

./time-diff.sh $input $output $straggler-straggler-spec-$specFlag-aggressiveness-$aggre
