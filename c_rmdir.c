///////////////////////////////////////////////////////////////////////////////

#include <unistd.h>
#include <errno.h>
#include <i_utils.h>

void  c_rmdir_ ( const char *path )
{
/*
   Suppose that *path is regular string which has length less than or 
   equal to MAXLEN_PATHNAME. We should check this fact out of this scope.
*/
   if ( c_utils_lenIsOK__(path) ) 
   {
      rmdir ( path ) ;
   }
   else
   {
      errno = ENAMETOOLONG ;     
   }
}
