#include <sys/stat.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <i_utils.h>

/*
   Recursive mkdir 
   Source:
      https://gist.github.com/JonathonReinhart/8c0d90191c38af2dcadb102c4e202950
	Modified: 2020-03-07_00-50-46
	Note: we should provide relative path starting at current position,
	not fully path starting at the root '/' point.

   IMPORTANT: 
      the current user needs at least 'w' and 'x' permissions to perform
      mkpath. Otherwise, it results error as errno=13 (Permission denied) 
*/

void  c_mkpath__( const char *path, mode_t mode )
{
   char buff [ MAXLEN_PATHNAME ] = "" ;

   if ( c_utils_buffer_NotOK__ ( path, buff ) ) return ;

// Looping over the string:   
   char *p ;
 
   for ( p = buff + 1; *p; p++ ) 
   {
      if ( *p == SLASH ) 
      {
// 		Truncating the string temporarily at this character '/'   
         *p = '\0';
         if ( mkdir( buff, mode ) != 0 ) 
         {
            if ( errno != EEXIST )
            {
               printf ( 
                  ">>> ERROR: creating %s, mode=%o, errno=%d\n", 
                  buff, mode, errno ) ;
               return ;
            }
            else
            {
               printf ( 
                  ">>> WARNING: %s exists, errno=%d\n", 
                  buff, errno ) ;
            }
         }
         else
         {
            printf ( 
               ">>> OK. %s created, mode=%o, errno=%d\n", 
               buff, mode, errno ) ;
         }
// 		Recovering the character:   
         *p = SLASH ;
      }
   }   
// the last one:   
   if ( mkdir ( buff, mode ) != 0 ) 
   {
      if ( errno != EEXIST )
      {
         printf ( 
            ">>> ERROR: creating %s with mode=%o, errno=%d\n", 
            buff, mode, errno ) ;
         return ;
      }
      else
      {
         printf ( 
            ">>> WARNING: %s exists, errno=%d\n", 
            buff, errno ) ;
      }
   }   
   else 
   {
      printf ( 
         ">>> OK. %s created, mode=%o, errno=%d\n", 
         buff, mode, errno ) ;
   }
}


/* INFO:

void  c_mkpath_decf_ ( const char *path, int *imode ) 
   imode is given as an int-kind number with an decimal value of octal 
   number, e.g.
      511 (i.e. 0777), 420 (i.e. 0644), 452 (i.e. 0704), ...
   We have to copy its value to a real octal-kind memory address using 
   the sprintf && sscanf procudure.
*/
void  c_mkpath_decf_ ( const char *path, int *imode ) 
{
   mode_t   old_mask = umask(0);
   c_mkpath__( path, (mode_t) *imode );
   umask (old_mask);
}


/* INFO:

void  c_mkpath_octf_ ( const char *path, int *imode ) 
   imode is given as an int-kind number but it's comming with an octal 
   value, e.g.
      0777, 0664, 0755, 700, 655, ...
   We have to copy its value to a real octal-kind memory address using 
   the sprintf && sscanf procudure.
*/
void  c_mkpath_octf_ ( const char *path, int *imode ) 
{
   int   ioctal ; 
   c_utils_oct2dec_ ( imode, &ioctal ) ;
   c_mkpath_decf_ ( path, &ioctal ) ; 
}


/* INFO:

void  c_mkpath_perm_ ( const char *path, const char *perm ) 
   Imput from Fortran, 
      perm = 'rwxr-xr-x' // C0
*/
void  c_mkpath_perm_ ( const char *path, const char *perm ) 
{
   int   imode ; 
   c_utils_per2dec_ ( perm, &imode ) ;
   c_mkpath_decf_ ( path, &imode ) ; 
}

/*
   Default:
*/
void  c_mkpath_ ( const char *path, int *imode ) 
{
   c_mkpath_decf_ ( path, imode ) ; 
}








////////////////////////////////////////////////////////////////////////////////

/*

#include <sys/stat.h>
   /usr/include/x86_64-linux-gnu/sys/stat.h
   +  mode_t, dev_t, gid_t, ino_t, 
   +  mkdir, mkfifo, 

#include <linux/limits.h> 
	/usr/include/linux/limits.h
	+ 	PATH_MAX = 4096 
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

