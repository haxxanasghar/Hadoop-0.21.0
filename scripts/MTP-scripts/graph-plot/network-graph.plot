set term png size 600, 400
set output outputFile
set key autotitle columnhead
set ylabel 'Bytes Received(MB)'
set xlabel 'Workload Size(GB)'
set title 'Network Consumption'
set style data linespoints
plot dataFile1 using 1:3 , dataFile2 using 1:3 linetype 4
