> use weblog;
> create function http_method (string) returns string location '/user/impala/udf/libudfhttpmethod.so' symbol='HttpMethod';

> select http_method('GET /index.html');
> select request, http_method(request) from weblog limit 3;
