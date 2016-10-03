#usage : ./wordcount-job.sh filesize blocksize experimentFile

fileSize=$1
blockSize=$2
experimentFile=$3


experimentFolder="experiment-data/$experimentFile"

rm -r $experimentFolder
mkdir -p $experimentFolder

jobdataFile="$experimentFolder/$experimentFile"

wordcountInputFile="/user/hduser/randomtextwriter-$fileSize-GB-$blockSize-block"
wordcountOutputFile="/user/hduser/$experimentFile"


date +"%D %T" > $jobdataFile

hadoop fs -rmr $wordcountOutputFile

nohup bash -c "sleep 30; ./jobId.sh $jobdataFile;" >/dev/null 2>&1 &

time hadoop jar ../hadoop-*examples*.jar wordcount $wordcountInputFile $wordcountOutputFile >> $jobdataFile

date +"%D %T" >> $jobdataFile

hadoop fs -rmr $wordcountOutputFile


