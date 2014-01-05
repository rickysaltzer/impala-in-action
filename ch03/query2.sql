/*
	Apple stock prices in August, 2013
*/	
SELECT yyyymmdd, 
       close_price 
FROM   stockprice 
WHERE  symbol = 'AAPL' 
       AND yyyymmdd LIKE '2013-08%' 
ORDER  BY yyyymmdd 
LIMIT  10; 