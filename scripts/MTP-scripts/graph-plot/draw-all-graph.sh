mapredTask=$1

./draw-general-graph.sh cpu $mapredTask
./draw-general-graph.sh memory $mapredTask
./draw-general-graph.sh energy $mapredTask
./draw-general-graph.sh power $mapredTask
./draw-general-graph.sh network $mapredTask
./draw-general-graph.sh job-completion-time $mapredTask
