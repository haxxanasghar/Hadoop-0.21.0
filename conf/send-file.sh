#$1 = folder containing file
#$2 = filename

sudo rsync -avxP /usr/local/hadoop/$1/$2 hduser@slave1:/usr/local/hadoop/$1/
sudo rsync -avxP /usr/local/hadoop/$1/$2 hduser@slave2:/usr/local/hadoop/$1/
sudo rsync -avxP /usr/local/hadoop/$1/$2 hduser@slave3:/usr/local/hadoop/$1/
sudo rsync -avxP /usr/local/hadoop/$1/$2 hduser@slave4:/usr/local/hadoop/$1/
sudo rsync -avxP /usr/local/hadoop/$1/$2 hduser@slave5:/usr/local/hadoop/$1/
