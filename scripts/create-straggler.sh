hadoopScriptsDir="/usr/local/hadoop/scripts"

ssh -f hduser@slave1 "cd $hadoopScriptsDir; nohup ./realProcessBehaviour.sh 2> /dev/null ; exit;" &

ssh -f hduser@slave3 "cd $hadoopScriptsDir; nohup ./realProcessBehaviour.sh 2> /dev/null ; exit;" &
