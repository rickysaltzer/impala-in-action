/*
	Create an Internal Weblog Table
*/
CREATE TABLE weblog 
  ( 
     ip_address  STRING, 
     userid      STRING, 
     date_time   TIMESTAMP, 
     request     STRING, 
     http_status SMALLINT, 
     size        INT 
  )
  STORED AS TEXTFILE;