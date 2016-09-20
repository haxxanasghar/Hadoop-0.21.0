#!/bin/bash

totalNetSend=0.0
totalNetRecv=0.0

#set initial time equal to 0
SECONDS=0

echo "0.0, 0.0" > $1

for (( i=1; ; ))
do
        PidList=`jps | grep -E "Child" | cut -d " " -f 1 | paste -sd\|`
        PidCount=`echo $PidList | tr "|" "\n" | wc -l`

        sudo nethogs -t -c 4 -v 0 | grep -E $PidList | tail -n $PidCount > currentNetworkUsage

        cat currentNetworkUsage | awk 'BEGIN{SumNetSend=0.0; SumNetRec=0.0;}  {SumNetSend += $2; SumNetRec += $3;} END {print "send="SumNetSend; print "recv="SumNetRec;}' > netData

        source netData
        #echo $send, $recv, $i
        #Only count if network usage is greater than 1 KB/s
        if (( $(bc <<< "$send > 0") || $(bc <<< "$recv > 0") ))
        then
		totalNetSend=$(echo "$totalNetSend+$send" | bc -l)
                totalNetRecv=$(echo "$totalNetRecv+$recv" | bc -l)
                i=$(($i+1))
        fi
	
        if [[ $i -ne 0 && $((i%5)) == 0 ]]
        then
                NetSendUsage=$(echo "$totalNetSend/$i" | bc -l)
                NetRecvUsage=$(echo "$totalNetRecv/$i" | bc -l)

                #echo "after 5 iteration*************"
                elapsedSeconds=$SECONDS
                DataSendKB=$(echo "$NetSendUsage * $elapsedSeconds" | bc -l)
                DataRecvKB=$(echo "$NetRecvUsage * $elapsedSeconds" | bc -l)
               	#echo $NetSendUsage, $NetRecvUsage, $i, $elapsedSeconds, $DataSendKB, $DataRecvKB
                echo $DataSendKB, $DataRecvKB > $1
        fi
        sleep 1
done

NetSendUsage=$(echo "$totalNetSend/$i" | bc -l)
NetRecvUsage=$(echo "$totalNetRecv/$i" | bc -l)

#echo "after 5 iteration*************"
elapsedSeconds=$SECONDS
DataSendKB=$(echo "$NetSendUsage * $elapsedSeconds" | bc -l)
DataRecvKB=$(echo "$NetRecvUsage * $elapsedSeconds" | bc -l)
#echo $NetSendUsage, $NetRecvUsage, $i, $elapsedSeconds, $DataSendKB, $DataRecvKB
echo $DataSendKB, $DataRecvKB > $1

