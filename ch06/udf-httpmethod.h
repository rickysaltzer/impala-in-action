#ifndef SAMPLES_UDF_H
#define SAMPLES_UDF_H

#include <impala_udf/udf.h>

using namespace impala_udf;

// Usage: > create function http_method(string) returns string
//          location '/user/impala/udf/libudfhttpmethod.so' 
//          SYMBOL='HttpMethod';
//        > select httpmethod('method method');
//        > select httpmethod(c1) from t1;
StringVal HttpMethod(FunctionContext* context, const StringVal& arg1);

#endif

