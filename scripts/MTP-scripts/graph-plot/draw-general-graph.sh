
GraphName=$1
mapredTask=$2
datafolder="../$GraphName-consumption"

./run-general-graph-plot.sh  $datafolder/$GraphName-consumption-spec-off-5gb-50gb-blocksize-256-mapred-$mapredTask-task $datafolder/$GraphName-consumption-spec-on-5gb-50gb-blocksize-256-mapred-$mapredTask-task  $datafolder/$GraphName-consumption-spec-off-on-5gb-50gb-blocksize-256-mapred-$mapredTask-task $GraphName-graph.plot


./run-general-graph-plot.sh  $datafolder/$GraphName-consumption-spec-off-5gb-50gb-blocksize-512-mapred-$mapredTask-task $datafolder/$GraphName-consumption-spec-on-5gb-50gb-blocksize-512-mapred-$mapredTask-task  $datafolder/$GraphName-consumption-spec-off-on-5gb-50gb-blocksize-512-mapred-$mapredTask-task $GraphName-graph.plot


./run-general-graph-plot.sh  $datafolder/$GraphName-consumption-spec-off-5gb-50gb-blocksize-256-mapred-$mapredTask-task $datafolder/$GraphName-consumption-spec-off-5gb-50gb-blocksize-512-mapred-$mapredTask-task  $datafolder/$GraphName-consumption-spec-off-5gb-50gb-blocksize-256-512-mapred-$mapredTask-task $GraphName-graph.plot


./run-general-graph-plot.sh  $datafolder/$GraphName-consumption-spec-on-5gb-50gb-blocksize-256-mapred-$mapredTask-task $datafolder/$GraphName-consumption-spec-on-5gb-50gb-blocksize-512-mapred-$mapredTask-task  $datafolder/$GraphName-consumption-spec-on-5gb-50gb-blocksize-256-512-mapred-$mapredTask-task $GraphName-graph.plot

