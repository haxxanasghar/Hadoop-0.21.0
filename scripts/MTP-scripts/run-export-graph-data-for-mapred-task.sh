#!/bin/bash

workload=$1  #terasort/wordcount
blockSize=$2
straggler=$3 #with/without     
specFlag=$4  #off/on-with-original/on-without-origina
aggre=$5     #no/low/medium/high

startSize=$6
endSize=$7
inc=$8

powermeterData=$9

./get-jobs-start-end-time.sh $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc

./extract-per-job-energy-data-from-powermeter-data.sh powermeter-data/$powermeterData $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc

./export-graph-data-for-job-completion-time.sh $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc

./export-graph-data-for-cpu.sh $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc

./export-graph-data-for-memory.sh $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc

./export-graph-data-for-network.sh $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc

./export-graph-data-for-energy.sh $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc

./export-graph-data-for-power.sh $workload $blockSize $straggler $specFlag $aggre $startSize $endSize $inc


