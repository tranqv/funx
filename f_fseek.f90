!-----------------------------------------------------------------------
!
!     fseek, fseeko - reposition a file-position indicator in a stream
!
!     fseek sets the file position of the STREAM to the given OFFSET.
!     ISTAT =  0  if OK, 
!           = -1  on error.
!
!     Returns: istat = 0 if OK, -1 on error.
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
      subroutine  f_fseek ( file, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_file, ck_long, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_long),intent(in) :: offset 
      integer(kind=ck_int),intent(in)  :: whence 
      integer(kind=ck_int),intent(out) :: istat
!
      external    c_fseek 
!
!
      call c_fseek ( file % ptr, offset, whence, istat )
!
      return 
      end subroutine f_fseek
!
!-----------------------------------------------------------------------
!
!
!-----------------------------------------------------------------------
!
!     New version: 
!        Pass arguments using its reference with value in integer(8),
!        i.e. intptr_t defined in /usr/include/stdint.h
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!        iptr = (intptr_t) (FILE *) fp
!
!-----
      subroutine  f_fseek_intref ( iptr, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_long, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr  
      integer(kind=ck_long),intent(in) :: offset 
      integer(kind=ck_int),intent(in)  :: whence 
      integer(kind=ck_int),intent(out) :: istat
!
      external    c_fseek_intref 
!
!
      call c_fseek_intref ( iptr, offset, whence, istat )
!
      return 
      end subroutine f_fseek_intref
!
!-----------------------------------------------------------------------
