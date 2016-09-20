
#Get RAM size in bytes from /proc/meminfo
totalRAM=`cat /proc/meminfo | head -n 1 | awk '{print $2}'`

totalCPU=0.0
totalMem=0.0
totalNetSend=0.0
totalNetRec=0.0


for (( i=1; ; ))
do
	PidList=`jps | grep -E "Child" | cut -d " " -f 1 | paste -sd\|`
	PidCount=`echo $PidList | tr "|" "\n" | wc -l`

        ps aux|awk  '{print $2,$3,$4}' | grep -E $PidList | awk 'BEGIN{SUMCPU=0.0; SUMMEM=0.0;} {SUMCPU += $2; SUMMEM += $3} END {print "x="SUMCPU; print "y="SUMMEM;}' > cpuMemData

	#sudo nethogs -t -c 3 -v 0 | grep -E $PidList | awk 'BEGIN{SumNetSend=0.0; SumNetRec=0.0} {SumNetSend += $2; SumNetRec += $3} END {print "a="SumNetSend; print "b="SumNetRec;}' > netData
	sudo nethogs -t -c 2 -v 0 | grep -E $PidList | awk 'BEGIN{SumNetSend=0.0; SumNetRec=0.0; count=0;} {SumNetSend += $2; SumNetRec += $3; count +=1;} END { if(count % $PidCount == 0) {print "send="(SumNetSend*$PidCount)/count; print "recv="(SumNetRec*$PidCount)/count; print "count="count;} else {print "send=0.0"; print "recv=0.0"; print "count=0"; }}' > netData
	
	echo "***********" > netData
        #Jps is search to avoid null string to grep command

        source cpuMemData
	source netData
        echo $x, $y, $i
        if [[ $x != 0 || $y != 0 ]]
        then
                totalCPU=$(echo "$totalCPU + $x" | bc -l)
                totalMem=$(echo "$totalMem + $y" | bc -l)
                i=$(($i+1))
        fi


        if [ $((i%20)) == 0 ]
        then
                #cat $1
                CPUUsage=$(echo "$totalCPU/$i" | bc -l)
                RAMUsage=$(echo "($totalMem*$totalRAM)/(($i)*100)" | bc -l)

                echo "after 20 iteration*************"
                echo $CPUUsage, $RAMUsage, $i
                echo $CPUUsage, $RAMUsage > $1
        fi
        sleep 1
done

#echo $totalRAM, $i
CPUUsage=$(echo "$totalCPU/$i" | bc -l)
RAMUsage=$(echo "($totalMem*$totalRAM)/(($i-1)*100)" | bc -l)

#echo $totalCPU, $totalMem
echo $CPUUsage, $RAMUsage > $1

