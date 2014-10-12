> install.packages(“RImpala”)

> library(RImpala) 
> rimpala.init(libs="/opt/jars/impala-jdbc-0.5-2") 
> rimpala.connect("192.168.122.189", "21050")     
> rimpala.showdatabases()                        
> rimpala.usedatabase("weblog")                 
> ds = rimpala.query("select substr(requesttime, 2, 11) as dayofmonth,     count(*) as hits from weblog group by dayofmonth order by dayofmonth limit 31")                                                             
> traffic<-ds$hits
> webts <- ts(traffic, frequency=1) 
> plot(webts)                                                   
