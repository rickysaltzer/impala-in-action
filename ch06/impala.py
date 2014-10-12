>>> import impala.dbapi                                                  #A
>>> conn = impala.dbapi.connect('192.168.122.189', port=21050)           #B
>>> cursor = conn.cursor()                                               #C
>>> cursor.execute('SELECT * FROM weblog.weblog WHERE substr(requesttime,2,11) > "24/Aug/1995" ORDER BY requesttime LIMIT 3'); #D 
>>> for row in cursor:                                                   #E
...     print row
... 

