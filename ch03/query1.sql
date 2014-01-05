/*
	Listing 3.1
	Select the maximum stock price using Impala
*/
SELECT max(close_price) FROM stockprice WHERE yyyymmdd LIKE '2009%' AND symbol = 'NOK';