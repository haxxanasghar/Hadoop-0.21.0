hadoop job -list > listofJobsRunning

hadoop job -kill `cat listofJobsRunning |tail -n 1 | awk '{print $1}'`
