////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "i_utils.h"

//

void  c_realpath_ ( 
   const char *fname, char *path, size_t *len_path, size_t *lentrim_path ) 
{
   char     buff [ MAXLEN_PATHNAME ] = "" ;
   size_t   lm = *len_path ; 
   size_t   lt = 0 ; 
   char     *ptr = realpath ( fname, &buff[0] ) ; 

   errno = 0 ; 

   if ( ptr == NULL )
   {
      lt = 0 ;      
   }
   else 
   {
      lt = strlen( buff ) ; 
      if ( lt > lm ) 
      {
         errno = ERANGE ; 
         printf ( 
            "WARNNG: c_realpath_ requires a larger PATH. "
            "len realpath = %ld  > len PATH =%ld \n",
            lt, lm  
         ) ; 
         lt = lm ;        
         strncpy ( path, buff, lt ) ;
      }
      else 
      {
         strncpy ( path, buff, lm ) ;
      }
   }
   *lentrim_path = lt ; 
}

//

void  c_abspath_ ( 
   const char *fname, char *path, size_t *len_path, size_t *lentrim_path ) 
{
   c_realpath_ ( fname, path, len_path, lentrim_path ) ; 
}


///////////////////////////////////////////////////////////////////////////////
//
// to work with allocatable array of character. Later on, we use this for 
// str as type(string).
//

char * c_abspath_TmpBuff ;

// To obtain the length of string, i.e. len_val (not counting NULL) 

void  c_abspath_prep_ ( const char *fname, size_t *len_val )
{
   char  buff [ MAXLEN_PATHNAME ] = "" ;
   char  *ptr = realpath ( fname, &buff[0] ) ; 

   if ( ptr == NULL )
   {
      *len_val = 0 ;      
      errno = EEXIST ; 
   }
   else 
   {
      *len_val = strlen ( ptr ) ; 
      if ( *len_val > 0 ) 
      {
         c_abspath_TmpBuff = (char *) malloc ( sizeof(char) * (*len_val + 1) );
         strncpy ( c_abspath_TmpBuff, buff, *len_val+1 ) ;
      }

   }
}

// then, copy the result in the buff c_abspath_TmpBuff to *val

void  c_abspath_post_ ( size_t *len_val, char *val )
{
   if ( *len_val > 0 ) 
   {
      strncpy ( val, c_abspath_TmpBuff, *len_val ) ;
      free ( c_abspath_TmpBuff );
   }
}











////////////////////////////////////////////////////////////////////////////////
/*
#include <stdlib.h>
   /usr/include/stdlib.h

   +  realpath 

         char *realpath ( const char *file_name, char *resolved_name )

         Return the canonical absolute name of FILE_NAME. If RESOLVED_NAME 
      is null, the result is malloc'd; otherwise, if the canonical name is
      PATH_MAX chars or more, returns null with 'errno' set to ENAMETOOLONG; 
      if the name fits in fewer than PATH_MAX chars, returns the name in 
      RESOLVED.

         Upon successful completion, realpath() shall return a pointer to 
      the resolved name. Otherwise, realpath() shall return a null pointer 
      and set errno to indicate the error, and the contents of the buffer 
      pointed to by resolved_name are undefined.

      ERRORS

         The realpath() function shall fail if:

      [EACCES]
         Read or search permission was denied for a component of file_name.
      [EINVAL]
         The file_name argument is a null pointer.
      [EIO]
         An error occurred while reading from the file system.
      [ELOOP]
         A loop exists in symbolic links encountered during resolution of the 
         file_name argument.
      [ENAMETOOLONG]
         The length of the file_name argument exceeds {PATH_MAX} or a pathname 
         component is longer than {NAME_MAX}.
      [ENOENT]
         A component of file_name does not name an existing file or file_name 
         points to an empty string.
      [ENOTDIR]
         A component of the path prefix is not a directory.

      The realpath() function may fail if:

      [ELOOP]
         More than {SYMLOOP_MAX} symbolic links were encountered during resolution 
         of the file_name argument.
      [ENAMETOOLONG]
         Pathname resolution of a symbolic link produced an intermediate result 
         whose length exceeds {PATH_MAX}.
      [ENOMEM]
         Insufficient storage space is available.


*/
