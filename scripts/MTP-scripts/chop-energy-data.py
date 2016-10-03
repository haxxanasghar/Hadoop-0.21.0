
#2016-08-22T22:46:00+05:30,3837796352,0,1258639360,189767680,1277820928,8240672768

import sys

def chop(start_time, end_time, inputfilename, outputfilename, write):
	if write :
		file_output = open(outputfilename, "w")
	else :
		file_output = open(outputfilename, "a")
	f = open(inputfilename)
	#start_time = [int(x) for x in start.split(':')] #['hr', 'min', 'sec']
	#end_time = [int(x) for x in end.split(':')]

	line = f.readline()
	#file_output.write(line)
	outputSomething = False
	
	for line in f:
		#Ignore empty lines
		if not line.rstrip():
			continue

		split_line = [x.strip() for x in line.split(',')]
		split_timestamp = [x.strip() for x in split_line[1].split(' ')]
		split_time = [x.strip() for x in split_timestamp[0].split('"')]
		time = [int(x.strip()) for x in split_time[1].split(':')]
		#print time
		if(time_within(start_time, end_time, time)):
			#print "true"
			#file_output.write(line)
			file_output.write(split_time[1] + "\t" + split_line[2][1:-1]+"\n")
			outputSomething = True
		else :
			#print "false"
			if outputSomething == True:
				break

	file_output.close()
	f.close()


def time_within(start_time, end_time, time):
	if greater_than_equal(time, start_time) and greater_than_equal(end_time, time):
		return True
	return False

def greater_than_equal(time1, time2):
	if time1[0] > time2[0]:
		return True
	elif time1[0] == time2[0]:
		if time1[1] > time2[1]:
			return True
		elif time1[1] == time2[1]:
			if time1[2] >= time2[2]:
				return True
			else :
				return False
		else :
			return False
	else :
		return False


#chop(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])

start = sys.argv[1]
end = sys.argv[2]

start_time = [int(x) for x in start.split(':')] #['hr', 'min', 'sec']
end_time = [int(x) for x in end.split(':')]

if start_time[0] > end_time[0]:
	start_time1 = start_time
	end_time1 = [23, 59, 59]
	chop(start_time1, end_time1, sys.argv[3], sys.argv[4], True)	    	

	start_time2 = [0, 0, 0]
	end_time2 = end_time
	chop(start_time2, end_time2, sys.argv[3], sys.argv[4], False)	    	

else :
	chop(start_time, end_time, sys.argv[3], sys.argv[4], True)	
