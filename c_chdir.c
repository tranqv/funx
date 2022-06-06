/*
   /usr/include/unistd.h
      chown, chdir, link, symlink, unlink, rmdir, 
      getlogin, setlogin, gethostname, sethostname, etc 

*/

#include <unistd.h>

void  c_chdir_ ( char *path )
{
    chdir ( path ) ;
}
