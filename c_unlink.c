#include <unistd.h>

void  c_unlink_ ( const char *path )
{
/*
   Suppose that *path is regular string which has length less than or 
   equal to MAXLEN_PATHNAME. We should check this fact out of this scope.
*/
    unlink ( path ) ;
}
