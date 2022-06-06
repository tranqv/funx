////////////////////////////////////////////////////////////////////////////////

#include <sys/stat.h>
#include <errno.h>

#include "i_utils.h"

////////////////////////////////////////////////////////////////////////////////

/*
   IMPORTANT: By default, all integers are given in decimal presentation. 
*/

/*
   imode is given as decimal presentation with real octal value, e.g.  
      511 (i.e. 0777), 420 (i.e. 0644), 452 (i.e. 0704), ...
   We do not have to translate. 
*/
void  c_mkdir_decf_ ( const char *path, int *imode ) 
{
   if ( c_utils_lenIsOK__(path) ) 
   {
      mode_t   old_mask = umask(0);
      mkdir ( path, (mode_t) *imode );
      umask ( old_mask );
   }
   else
   {
      errno = ENAMETOOLONG ;
   }
}


/*
   imode is given as in decimal presentation. 
   If we want to define it as octal value, e.g.
      0777, 0664, 0755, 700, 655, ...
   Then we have to translate. 
*/

void  c_mkdir_octf_ ( const char *path, int *imode ) 
{
   int   idec = 0 ;
   c_utils_oct2dec_ ( imode, &idec ) ; 
   c_mkdir_decf_ ( path, &idec ) ;
}


/*
   Imput from Fortran, 
      perm = 'rwxr-xr-x' // C0
*/
void  c_mkdir_perm_ ( const char *path, char *perm ) 
{
   int   idec = 0 ; 
   c_utils_per2dec_ ( &perm[0], &idec ) ;
   c_mkdir_decf_ ( path, &idec ) ;
}

/*
   Default:
*/
void  c_mkdir_ ( const char *path, int *imode ) 
{
   c_mkdir_decf_ ( path, imode ) ; 
}










/*

#include <sys/stat.h>
   /usr/include/x86_64-linux-gnu/sys/stat.h
   +  mode_t, dev_t, gid_t, ino_t, 
   +  mkdir, mkfifo, 

*/

/*

IEEE Std 1003.1 2017, p. 1316

   #include <sys/stat.h>

   int  mkdir ( const char *path, mode_t mode ) ;

   Upon successful completion, these functions shall return 
      0  
   Otherwise, these functions shall return
      -1 
   and set 
      errno 
   to indicate the error. If -1 is returned, no directory shall be created.

*  ERRORS:     (communicated via the errno variable, #include <errno.h>)
   ------

   [EACCES]    Search permission is denied on a component of the path prefix, or 
               write permission is denied on the parent directory of the directory 
               to be created.
   [EEXIST]    The named file exists.
   [ELOOP]     A loop exists in symbolic links encountered during resolution of 
               the path argument.
   [EMLINK]    The link count of the parent directory would exceed {LINK_MAX}.
   [ENAMETOOLONG]    The length of a component of a pathname is longer than {NAME_MAX}.
   [ENOENT]    A component of the path prefix specified by path does not name an 
               existing directory or path is an empty string.
   [ENOSPC]    The file system does not contain enough space to hold the contents 
               of the new directory or to extend the parent directory of the new 
               directory.
   [ENOTDIR]   A component of the path prefix names an existing file that is neither 
               a directory nor a symbolic link to a directory.
   [EROFS]     The parent directory resides on a read-only file system

*/

