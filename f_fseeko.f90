!-----------------------------------------------------------------------
!
!     Returns: istat = 0 if OK , -1 on error.
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
!
      subroutine  f_fseeko ( file, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_file, ck_off_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_off_t),intent(in)   :: offset 
      integer(kind=ck_int),intent(in)     :: whence 
      integer(kind=ck_int),intent(out)    :: istat
!
      external    c_fseeko 
!
!
      call c_fseeko ( file % ptr, offset, whence, istat )
!
      return 
      end subroutine f_fseeko
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
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
      subroutine  f_fseeko_intref ( iptr, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_off_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_off_t),intent(in)      :: offset 
      integer(kind=ck_int),intent(in)        :: whence 
      integer(kind=ck_int),intent(out)       :: istat
!
      external    c_fseeko_intref 
!
!
      call c_fseeko_intref ( iptr, offset, whence, istat )
!
      return 
      end subroutine f_fseeko_intref

!-----------------------------------------------------------------------
!
!
