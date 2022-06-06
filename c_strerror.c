#include <errno.h>
#include <string.h>

void  c_strerror_ ( 
      int *err, char *str, size_t *lenmax_str, size_t *lentrim_str, int *errc 
)
{
   char *estr ;
   int errno_save ;

   size_t ldum = *lenmax_str ; 

   errno_save = errno ; 
   errno = 0 ;

   estr = strerror ( *err ) ;

   *errc = errno ; 
   errno = errno_save ;

   strncpy ( str, estr, ldum ) ;
   *lentrim_str = strlen ( str ) ; 
}
/*
   REF: 

   /usr/include/errno.h
   +  errno 

   /usr/include/string.h
   +  strerror, strncpy
*/
