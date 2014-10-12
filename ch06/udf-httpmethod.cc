#include "udf-sample.h"

#include <cctype>
#include <cmath>
#include <string>

// Return the HTTP method string (GET PUT, POST, DELETE, ...)

StringVal HttpMethod(FunctionContext* context, const StringVal& arg1) {
 if (arg1.is_null) return StringVal::null();

 int index;
 std::string original((const char *)arg1.ptr,arg1.len);
 std::string method("");

 for (index = 1; index < original.length(); index++) {
   uint8_t c = original[index];

   if (c == ' ' || c == '\t' ) {
     break;
   }
   else {
       method.append(1, (char)c);
   }
 }

 StringVal result(context, method.size());
 memcpy(result.ptr, method.c_str(), method.size());
 return result;
}

