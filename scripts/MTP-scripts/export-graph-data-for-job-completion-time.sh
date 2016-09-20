#!/bin/bash

blockSize=$1
specFlag=$2 #off/on
mapredTask=$3

input="jobs-start-end-time/jobs-start-end-time-spec-$specFlag-5gb-50gb-blocksize-$blockSize-mapred-$mapredTask-task"
output="job-completion-time-consumption/job-completion-time-consumption-spec-$specFlag-5gb-50gb-blocksize-$blockSize-mapred-$mapredTask-task"

./time-diff.sh $input $output Spec-$specFlag-BlockSize-$blockSize
