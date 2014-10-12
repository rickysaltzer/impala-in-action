>>> import impala.util 
>>> cursor.execute('SELECT * FROM weblog.weblog WHERE substr(requesttime,2,11) > "24/Aug/1995" ORDER BY requesttime LIMIT 3');
>>> dataframe = impala.util.as_pandas(cursor)        
>>> dataframe                                       

>>> dataframe[0:2]                                                     

>>> dataframe = impala.util.as_pandas(cursor) >>> dataframe[0:2]                                                     
>>> status = dataframe['replycode']
>>> status.value_counts()status = dataframe['replycode']

>>> status = dataframe.groupby('replycode')
>>> status.size()

>>> dv = dataframe['bytes']
>>> dv.describe()

>>> cursor.execute('SELECT substr(requesttime,2,11) as dayofmonth, sum(bytes) as bytes  FROM weblog.weblog WHERE substr(requesttime,2,11) > "24/Aug/1995" GROUP BY dayofmonth ORDER BY dayofmonth LIMIT 31')
>>> import impala.util
>>> df = impala.util.as_pandas(cursor)
>>> df

>>> import matplotlib.pyplot as plt
>>> df['bytes'].plot()
>>> plt.ylabel('Total number of bytes in GB')
>>> plt.show()

