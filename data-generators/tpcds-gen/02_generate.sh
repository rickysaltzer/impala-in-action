#!/bin/bash

PROJECT_DIR=$PWD
TPCDS_OUT="$PWD/data/"
TPCDS_DIR="generate"
SCALE=${SCALE:-1}
NUM_CPUS=$(cat /proc/cpuinfo | grep processor | wc -l)
TABLES="store_sales inventory time_dim store household_demographics item customer_address customer_demographics date_dim warehouse customer"

# Check to make sure build.sh was already ran
if [ ! -d $TPCDS_DIR ];
then
	echo "Looks like you haven't built yet, please run build.sh first"
	exit 1
fi
cd $TPCDS_DIR/tools
echo "Using scale factor of $SCALE"
echo "Building your dataset (this may take some time)..."

counter=0
for table in $TABLES
do
	mkdir -p $TPCDS_OUT/$table
	for cpu in $(seq 1 $NUM_CPUS)
	do
		counter=$(expr $counter + 1)
		./dsdgen -force Y -suffix ".dat" -verbose N -scale $SCALE -quiet Y -dir $TPCDS_OUT/$table -parallel $NUM_CPUS -child $cpu -table $table &
		GEN_PIDS[$counter]=$!
	done
done

for PID in ${GEN_PIDS[*]}
do
	wait $PID
done
