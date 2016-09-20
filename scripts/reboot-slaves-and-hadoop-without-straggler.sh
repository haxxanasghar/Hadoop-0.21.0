

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



echo "restart-hadoop finish"
