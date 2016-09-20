#<<"COMMENT"

#COMMENT


blockSize=$1
jobDesp=$2 #like=spec-off-mapred-8-task


./reboot-slaves-and-hadoop.sh

./sort-experiment.sh 5 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 10 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 15 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 20 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 25 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 30 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 35 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 40 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 45 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh
./sort-experiment.sh 50 $blockSize $jobDesp
./reboot-slaves-and-hadoop.sh


