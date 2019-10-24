#!/usr/bin/env sh

# Download and prettify csv-file
wget -q -O - https://data.cityofnewyork.us/api/views/kku6-nxdu/rows.csv\?accessType\=DOWNLOAD \ | sed -e "1s/\s/\_/g;s/.*/\L&/" > stats.csv

docker-compose up -d

#docker exec -it databank mysql -uroot -pexample stats -e "LOAD DATA LOCAL INFILE '/var/lib/mysql-files/stats.csv' INTO TABLE demographic_stats FIELDS TERMINATED BY ',' IGNORE 1 LINES;"
docker exec -it databank mysql -uroot -pexample stats -e "SELECT count(*) FROM demographic_stats;"

