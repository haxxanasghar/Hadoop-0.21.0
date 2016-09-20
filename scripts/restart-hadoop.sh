stop-dfs.sh
stop-mapred.sh
start-dfs.sh
start-mapred.sh
date +"%D %T" >> JpsCount 
slaves.sh jps | wc -l >>JpsCount
slaves.sh jps | wc -l

