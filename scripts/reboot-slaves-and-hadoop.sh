

ssh -f hduser@slave1 "sudo reboot; exit;" &
ssh -f hduser@slave2 "sudo reboot; exit;" &
ssh -f hduser@slave3 "sudo reboot; exit;" &
ssh -f hduser@slave4 "sudo reboot; exit;" &
ssh -f hduser@slave5 "sudo reboot; exit;" &

echo "reboot finish"

sleep 300

echo "sleep finish"

./restart-hadoop.sh

hadoop dfsadmin -safemode leave

hadoopScriptsDir="/usr/local/hadoop/scripts"

ssh -f hduser@slave1 "cd $hadoopScriptsDir; nohup ./realProcessBehaviour.sh 2> /dev/null ; exit;" &

ssh -f hduser@slave3 "cd $hadoopScriptsDir; nohup ./realProcessBehaviour.sh 2> /dev/null ; exit;" &

echo "restart-hadoop finish"
