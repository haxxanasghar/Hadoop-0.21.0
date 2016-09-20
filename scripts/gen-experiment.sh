#usage : ./gen-experiment.sh filesize blcokSize

fileSize=$1
blockSize=$2

experimentFile="teragen-$fileSize-GB-$blockSize-block"

./get_cpu_mem_usage_forJob.sh $experimentFile
./get_network_usage_forJob.sh $experimentFile

./teragen-job.sh $fileSize $blockSize

./copy-cpu-mem-usage-from-slaves.sh $experimentFile
./copy-network-usage-from-slaves.sh $experimentFile
