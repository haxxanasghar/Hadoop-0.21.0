#usage : ./terasort-job.sh filesize blocksize miscInfo

fileSize=$1
blockSize=$2
miscInfo=$3

experimentFile="terasort-$fileSize-GB-$blockSize-block-$miscInfo"
experimentFolder="experiment-data/$experimentFile"

rm -r $experimentFolder
mkdir -p $experimentFolder

jobdataFile="$experimentFolder/$experimentFile"

terasortInputFile="/user/hduser/terasort-input-$fileSize-GB-$blockSize-block"
terasortOutputFile="/user/hduser/terasort-output-$fileSize-GB-$blockSize-block-$miscInfo"


date +"%D %T" > $jobdataFile

hadoop fs -rmr $terasortOutputFile

nohup bash -c "sleep 30; ./jobId.sh $jobdataFile;" >/dev/null 2>&1 &

time hadoop jar ../hadoop-*examples*.jar terasort $terasortInputFile $terasortOutputFile >> $jobdataFile

date +"%D %T" >> $jobdataFile

hadoop fs -rmr $terasortOutputFile


