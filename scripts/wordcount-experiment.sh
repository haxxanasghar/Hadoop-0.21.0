#usage : ./wordcount-experiment.sh filesize blcokSize miscInfo


fileSize=$1
blockSize=$2
straggler=$3 #with/without
spec=$4      #off/on-with-original/on-without-original
aggre=$5     #no/low/medium/high


experimentFile="wordcount-$fileSize-GB-$blockSize-block-$straggler-straggler-spec-$spec-aggressiveness-$aggre"


./get_cpu_mem_usage_forJob.sh $experimentFile
./get_network_usage_forJob.sh $experimentFile

./wordcount-job.sh $fileSize $blockSize $experimentFile

./copy-cpu-mem-usage-from-slaves.sh $experimentFile
./copy-network-usage-from-slaves.sh $experimentFile
