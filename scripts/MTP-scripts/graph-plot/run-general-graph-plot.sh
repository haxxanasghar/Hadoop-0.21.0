#usage : ./run-general-graph-plot.sh datafile1 datafile2 outputfilename graphProgram

dataFile1=$1
dataFile2=$2
outputFile="$3.png"
graphProgram=$4

gnuplot -e "dataFile1='${dataFile1}'; dataFile2='${dataFile2}'; outputFile='${outputFile}';" $graphProgram
