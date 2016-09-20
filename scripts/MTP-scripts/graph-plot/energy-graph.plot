set term png size 600, 400
set output outputFile
set key autotitle columnhead
set ylabel 'Energy(Watt-hour)'
set xlabel 'Workload Size(GB)'
set title 'Energy Consumption'
set style data linespoints
plot dataFile1 using 1:2 , dataFile2 using 1:2 linetype 4
