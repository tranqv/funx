/*
   /usr/include/unistd.h
      chown, chdir, link, symlink, unlink, rmdir, 
      getlogin, setlogin, gethostname, sethostname,
*/

#include <unistd.h>

void  c_symlink_ ( const char *src, const char *des )
{
/*
   Suppose that *src and *des are regular strings which have length 
   less than or equal to MAXLEN_PATHNAME. We should check this fact
   out of this scope.
*/
   symlink ( src, des );
}
