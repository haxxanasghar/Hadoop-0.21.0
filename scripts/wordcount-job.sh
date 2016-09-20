date +"%D %T" > wordcount-$1

#argument1 = terasort-input(argument1)
time hadoop jar ../hadoop-*examples*.jar wordcount /user/hduser/wordcount-input-$1 /user/hduser/wordcount-output-$1 >> wordcount-$1

date +"%D %T" >> wordcount-$1
