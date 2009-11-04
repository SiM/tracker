#include "Echo_i.h"

char* Echo_i::echoString(const char* mesg) 
{  
   return CORBA::string_dup(mesg); 
}
