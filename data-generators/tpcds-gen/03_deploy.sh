#!/bin/bash

DB=${DB-"tpcds"}
IMPALA_HOST=${IMPALA_HOST-$(hostname)}
TPCDS_OUT="data"
HDFS_DIR="/user/$USER/tpcds"
TABLES="store_sales inventory time_dim store household_demographics item customer_address customer_demographics date_dim warehouse"

# Make all directories first
hadoop fs -mkdir -p $TABLES

# Copy Tables
for table in $TABLES
do
	echo "Copying $table..."
	hadoop fs -put $TPCDS_OUT/$table.dat $HDFS_DIR/$table/
do

# Create DDLs
for table in $TABLES
do
	export LOCATION=$HDFS_DIR/$table
	impala-shell -i $IMPALA_HOST -f ddls/$table.ddl
done
