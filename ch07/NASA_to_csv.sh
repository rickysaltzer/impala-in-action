SEP=$'\t'	
#
# get the NASA logs
#
wget -X GET -O NASA_access_log_Jul95.gz ftp://ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz
#
# create tab-separated csv file. 
#
zcat NASA_access_log_Jul95.gz | sed "s/ - - \[/${SEP}/g" | sed "s/\] \"/${SEP}/g" | sed "s/\" /${SEP}/g" | sed "s/\([0-9]*\) \([0-9]*\)$/ \1${SEP}\2 /g" | sed "s/ -$/${SEP}/g" > NASA_raw.csv
#
# get the geoip information for each NASA weblog. Prerequisite: freegeoip, open source tool on https://freegeoip.net/
#
./NASA_to_geoip.sh NASA_raw.csv > geoip_raw.csv
#
# create file with country_code + country_name 
#
grep -v "Not Found" geoip_raw.csv | cut -f 6-7 | sort | uniq > countries.csv
#
# extract the country_name from the geoip file (only purpose is to add an extra join in the tutorial)
#
grep -v "Not Found" geoip_raw.csv | cut -f 1-6 > geoip.csv 
#
# convert NASA timestamps to Impala timestamp format
./NASA_fix_timestamp.sh NASA_raw.csv > NASA_tmp.csv
#
# post fix trailing column
./NASA_fix_column.sh NASA_tmp.csv > weblog.csv

# compress
gzip weblog.csv
