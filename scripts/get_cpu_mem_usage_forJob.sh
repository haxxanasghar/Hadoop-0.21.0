#usage : ./get-cpu-usage.sh jobname

hadoopScriptsDir="/usr/local/hadoop/scripts"

ssh -f hduser@slave1 "cd $hadoopScriptsDir; nohup ./calculate_memory_cpu.sh $1-cpu-mem-slave1 2> /dev/null ; exit;" &
echo "slave1 finish"
ssh -f hduser@slave2 "cd $hadoopScriptsDir; nohup ./calculate_memory_cpu.sh $1-cpu-mem-slave2 2> /dev/null ; exit;" &
echo "slave2 finish"
ssh -f hduser@slave3 "cd $hadoopScriptsDir; nohup ./calculate_memory_cpu.sh $1-cpu-mem-slave3 2> /dev/null ; exit;" &
echo "slave3 finish"
ssh -f hduser@slave4 "cd $hadoopScriptsDir; nohup ./calculate_memory_cpu.sh $1-cpu-mem-slave4 2> /dev/null ; exit;" &
echo "slave4 finish"
ssh -f hduser@slave5 "cd $hadoopScriptsDir; nohup ./calculate_memory_cpu.sh $1-cpu-mem-slave5 2> /dev/null ; exit;" &
echo "slave5 finish"

