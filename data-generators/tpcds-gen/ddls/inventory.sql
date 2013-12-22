create database if not exists ${env:DB};
use ${env:DB};

drop table if exists inventory;

create external table inventory
(
    inv_date_sk			int,
    inv_item_sk			int,
    inv_warehouse_sk		int,
    inv_quantity_on_hand	int
)
row format delimited fields terminated by '|' 
location '${env:LOCATION}';
