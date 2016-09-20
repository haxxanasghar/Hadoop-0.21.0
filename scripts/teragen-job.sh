#usage : ./teragen-job.sh filesize blocksize

fileSize=$1
blockSize=$2

experimentFile="teragen-$fileSize-GB-$blockSize-block"
experimentFolder="experiment-data/$experimentFile"

rm -r $experimentFolder
mkdir -p $experimentFolder

jobdataFile="$experimentFolder/$experimentFile"
teragenInputFile="/user/hduser/terasort-input-$fileSize-GB-$blockSize-block"

date +"%D %T" > $jobdataFile

finalFileSize=$(($fileSize * 10000000))
finalBlcokSize=$(($blockSize * 1024 * 1024))

hadoop fs -rmr $teragenInputFile

nohup bash -c "sleep 30; ./jobId.sh $jobdataFile;" >/dev/null 2>&1 &

time hadoop jar ../hadoop-*examples*.jar teragen -D dfs.blocksize=$finalBlockSize $finalFileSize $teragenInputFile >> $jobdataFile

date +"%D %T" >> $jobdataFile

