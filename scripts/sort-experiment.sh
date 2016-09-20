#usage : ./sort-experiment.sh filesize blcokSize miscInfo

fileSize=$1
blockSize=$2
miscInfo=$3

experimentFile="terasort-$fileSize-GB-$blockSize-block-$miscInfo"

./get_cpu_mem_usage_forJob.sh $experimentFile
./get_network_usage_forJob.sh $experimentFile

./terasort-job.sh $fileSize $blockSize $miscInfo

./copy-cpu-mem-usage-from-slaves.sh $experimentFile
./copy-network-usage-from-slaves.sh $experimentFile
