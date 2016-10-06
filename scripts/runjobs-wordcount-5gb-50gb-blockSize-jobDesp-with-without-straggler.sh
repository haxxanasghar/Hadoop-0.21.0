#<<"COMMENT"

#COMMENT


#usage : ./wordcount-experiment.sh filesize blcokSize miscInfo

blockSize=1024
straggler="with" #with/without
spec="off"      #off/on-with-original/on-without-original
aggre="no"     #no/low/medium/high

./reboot-slaves-and-hadoop.sh

for (( i=10; i<=50; i=i+10))
do
	./wordcount-experiment.sh $i $blockSize $straggler $spec $aggre
	sleep 120
done


straggler="without"

./reboot-slaves-and-hadoop-without-straggler.sh

for (( i=10; i<=50; i=i+10))
do
        ./wordcount-experiment.sh $i $blockSize $straggler $spec $aggre
        sleep 120
done


<<"COMMENT"
./reboot-slaves-and-hadoop.sh


./wordcount-experiment.sh 5 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 10 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 15 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 20 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 25 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 30 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 35 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 40 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 45 $blockSize $straggler $spec $aggre
sleep 120
./wordcount-experiment.sh 50 $blockSize $straggler $spec $aggre
sleep 120
COMMENT
