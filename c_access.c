#include <unistd.h>

void  c_access_ ( char *path, int *mode, int *res )
{
    *res = access ( path, *mode ) ;
}

/*

#include <unistd.h>
   /usr/include/unistd.h            POSIX Standard: 2.10 Symbolic Constants
   +  R_OK  = 4 Test for read permission.
   +  W_OK  = 2 Test for write permission.
   +  X_OK  = 1 Test for execute permission. 
   +  F_OK  = 0 Test for existence. 

   +  access, 
         int access (const char *name, int type)
      Test for access to NAME using the real UID and real GID. 


access() -- Tests for file accessibility.

Synopsis:      
   #include <unistd.h>       
   int access ( const char *path, int amode ); 

Arguments:
   path     Pointer to the name of file to be checked.
   amode    Bitwise OR of the access permissions to be checked 
            (R_OK for read, W_OKfor write, X_OK for execute, and F_OK for existence).

Returns:
   0        If access is allowed.
   -1       On error with errno set to indicate the error. If access is not allowed, 
            errno will be set to EACCES.

Errors:      
   EACCES, EINVAL, ENAMETOOLONG, ENOENT, ENOTDIR, EROFS

Description:
   The access() function checks the accessibility of the file named by the PATH argument 
for the permissions indicated by AMODE, using the real user ID in place of the effective 
user ID and the real group ID in place of the effective group ID.

*/






