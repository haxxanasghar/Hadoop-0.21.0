#<<"COMMENT"

#COMMENT


blockSize=$1

./reboot-slaves-and-hadoop.sh

./randomtextwriter-experiment.sh 5 $blockSize
sleep 120
./randomtextwriter-experiment.sh 10 $blockSize
sleep 120
./randomtextwriter-experiment.sh 15 $blockSize
sleep 120
./randomtextwriter-experiment.sh 20 $blockSize
sleep 120
./randomtextwriter-experiment.sh 25 $blockSize
sleep 120
./randomtextwriter-experiment.sh 30 $blockSize
sleep 120
./randomtextwriter-experiment.sh 35 $blockSize
sleep 120
./randomtextwriter-experiment.sh 40 $blockSize
sleep 120
./randomtextwriter-experiment.sh 45 $blockSize
sleep 120
./randomtextwriter-experiment.sh 50 $blockSize
sleep 120

