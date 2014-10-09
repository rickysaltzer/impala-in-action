# Data

Get the csv files and import them in Impala
* weblog.csv.gz
* geoip.csv.gz
* countries.csv

```
$> gunzip weblog.csv.gz
$> gunzip geoip.csv.gz
$> hadoop fs -copyFromLocal weblog.csv NASA/weblog/
$> haddop fs -copyFromLocal geoip.csv NASA/geoip/
$> hadoop fs -copyFromLocal countries.csv NASA/countries/
```

# How the data was generated

The script `NASA_to_csv.sh` starts with downloading the NASA weblog set from ftp://ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz and reformat the file by splitting the data into columns.
An external service is called that translates the domain names into geoip information. If you want to run the service locally, see the [freegeoip project](https://github.com/fiorix/freegeoip). The script `NASA_to_geoip.sh` calls the geoip service. If no geoip information is found (a lot of domains that existed in 1995 no longer exists), the scripts performs a simple mapping from url to country. 

The countries are extracted from the output of the geoip service and saved in a separate file.

Finally, the date information in the NASA weblog file is converted to Impala's timestamp format by the script `NASA_fix_timestamp.sh` and a post fix is applied that fixes a trailing column `NASA_fix_columns.sh`.

For the exercise, not all the geoip lines are imported in Impala (this is to avoid having 2 tables with similar size).