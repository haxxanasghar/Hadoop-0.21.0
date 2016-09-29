#usage : ./randomtextwriter-job.sh filesize blocksize

fileSize=$1
blockSize=$2

experimentFile="randomtextwriter-$fileSize-GB-$blockSize-block"
experimentFolder="experiment-data/$experimentFile"

rm -r $experimentFolder
mkdir -p $experimentFolder

jobdataFile="$experimentFolder/$experimentFile"
randomtextwriterInputFile="/user/hduser/$experimentFile"

date +"%D %T" > $jobdataFile

finalFileSize=$(($fileSize * 1024*1024*1024))
finalBlockSize=$(($blockSize * 1024 * 1024))

hadoop fs -rmr $randomtextwriterInputFile

nohup bash -c "sleep 30; ./jobId.sh $jobdataFile;" >/dev/null 2>&1 &

time hadoop jar ../hadoop-*examples*.jar randomtextwriter -D dfs.blocksize=$finalBlockSize -D mapreduce.randomtextwriter.totalbytes=$finalFileSize $randomtextwriterInputFile >> $jobdataFile

date +"%D %T" >> $jobdataFile

