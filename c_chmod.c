////////////////////////////////////////////////////////////////////////////////

#include <errno.h>
#include <sys/stat.h>
#include <i_utils.h>

//

void  c_chmod_ ( const char *path, int *mode )
{
   if ( c_utils_lenIsOK__(path) ) 
   {
      chmod ( path, (mode_t) *mode ) ;
   }
   else
   {
      errno = ENAMETOOLONG ;
   }
}


////////////////////////////////////////////////////////////////////////////////
/*

#include <sys/stat.h>
   /usr/include/x86_64-linux-gnu/sys/stat.h

   +  #include <bits/types.h>      --> __mode_t
   +  mode_t
   +  chmod
         int chmod ( const char * FILE, mode_t MODE )
            Set file access permissions for FILE to MODE.
         If FILE is a symbolic link, this affects its target instead. 

      The chmod() function shall change S_ISUID, S_ISGID, S_ISVTX, and the file permission 
   bits of the file named by the pathname pointed to by the path argument to the corresponding 
   bits in the mode argument. The application shall ensure that the effective user ID of the 
   process matches the owner of the file or the process has appropriate privileges in order 
   to do this.

      Upon successful completion, these functions shall return 0. Otherwise, these functions 
   shall return -1 and set errno to indicate the error. If -1 is returned, no change to the 
   file mode occurs.

These functions shall fail if:

[EACCES]
    Search permission is denied on a component of the path prefix.
[ELOOP]
    A loop exists in symbolic links encountered during resolution of the path argument.
[ENAMETOOLONG]
    The length of a component of a pathname is longer than {NAME_MAX}.
[ENOENT]
    A component of path does not name an existing file or path is an empty string.
[ENOTDIR]
    A component of the path prefix names an existing file that is neither a directory nor 
   a symbolic link to a directory, or the path argument contains at least one non- <slash> 
   character and ends with one or more trailing <slash> characters and the last pathname 
   component names an existing file that is neither a directory nor a symbolic link to a 
   directory.
[EPERM]
    The effective user ID does not match the owner of the file and the process does not 
   have appropriate privileges.
[EROFS]
    The named file resides on a read-only file system.
*/
