!-----------------------------------------------------------------------
!
!     Tests for file accessibility:
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_access ( path, mode, res )
!  
      use mod_funx_param, only: ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(in)  :: mode 
      integer(kind=ck_int),intent(out) :: res  
!
      external    c_access 
!
!
      call c_access ( path//ck_char_nul, mode, res )
!
      end subroutine  f_access 
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!
!
!-----------------------------------------------------------------------
!
!   access() -- Tests for file accessibility.
!   
!   Synopsis:      
!      #include <unistd.h>       
!      int access ( const char *path, int amode ); 
!   
!   Arguments:
!      path     Pointer to the name of file to be checked.
!      amode    Bitwise OR of the access permissions to be checked 
!               	R_OK 	for read, 
!						W_OK 	for write, 
!						X_OK  for execute, and 
!						F_OK 	for existence.
!   
!   Returns:
!      0        If access is allowed.
!      -1       On error with errno set to indicate the error. If access is not allowed, 
!               errno will be set to EACCES.
!   
!   Errors:      
!      EACCES, EINVAL, ENAMETOOLONG, ENOENT, ENOTDIR, EROFS
!   
!   Description:
!      The access() function checks the accessibility of the file named by the PATH argument 
!   for the permissions indicated by AMODE, using the real user ID in place of the effective 
!   user ID and the real group ID in place of the effective group ID.
!   
