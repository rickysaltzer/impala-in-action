#!/bin/bash

TPCDS_URL="http://www.tpc.org/tpcds/dsgen/dsgen-download-files.asp?download_key=NaN"
TPCDS_FILE="tpcds_gen.zip"
TPCDS_DIR="generate"
PROJECT_DIR=$PWD

function not_installed {
	echo "Error: $1 not found, please install via yum or apt";
	exit 1;
}

function check_installed {
	which $1 > /dev/null 2>&1 || not_installed $1
}

# Check for dependencies
check_installed gcc
check_installed unzip

# Make foldure structure
mkdir -p $TPCDS_DIR
cd $TPCDS_DIR

if [ ! -f $TPCDS_FILE ]; 
then
	echo "Downloading TPC-DS..."
	curl --silent --output $TPCDS_FILE $TPCDS_URL
fi
echo "Uncompressing TPC-DS..."
unzip -o $TPCDS_FILE > /dev/null 2>&1 
cd tools
make clean
make
