#!/bin/bash

blockSize=$1
specFlag=$2
mapredTask=$3


./export-graph-data-for-cpu.sh $blockSize $specFlag $mapredTask
./export-graph-data-for-memory.sh $blockSize $specFlag $mapredTask
./export-graph-data-for-network.sh $blockSize $specFlag $mapredTask
./export-graph-data-for-energy.sh $blockSize $specFlag $mapredTask
./export-graph-data-for-power.sh $blockSize $specFlag $mapredTask
./get-jobs-start-end-time.sh $blockSize $specFlag $mapredTask
./export-graph-data-for-job-completion-time.sh $blockSize $specFlag $mapredTask
