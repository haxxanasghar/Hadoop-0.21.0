#<<"COMMENT"

#COMMENT

<<"COMMENT"

blockSize=$1

./gen-experiment.sh 5 $blockSize
sleep 120
./gen-experiment.sh 10 $blockSize
sleep 120
./gen-experiment.sh 15 $blockSize
sleep 120
./gen-experiment.sh 20 $blockSize
sleep 120
./gen-experiment.sh 25 $blockSize
sleep 120
./gen-experiment.sh 30 $blockSize
sleep 120
./gen-experiment.sh 35 $blockSize
sleep 120
./gen-experiment.sh 40 $blockSize
sleep 120
./gen-experiment.sh 45 $blockSize
sleep 120
./gen-experiment.sh 50 $blockSize
sleep 120

COMMENT
