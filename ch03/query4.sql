/*
	Create an external table for stock prices
*/
CREATE EXTERNAL TABLE stockprice 
  ( 
     symbol         STRING, 
     yyyymmdd       STRING, 
     open_price     FLOAT, 
     high_price     FLOAT, 
     low_price      FLOAT, 
     close_price    FLOAT, 
     stock_volume   INT, 
     adjclose_price FLOAT 
  ) 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED Y '\n'
LOCATION '/user/impala/input';