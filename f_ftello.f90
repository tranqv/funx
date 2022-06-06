!-----------------------------------------------------------------------
!
!     Returns: pos = current file position indicator if OK, -1 on error.
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
      subroutine  f_ftello ( file, pos ) 
!
      use mod_funx_param, only: ck_file, ck_off_t
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_off_t),intent(out)  :: pos
!
      external    c_ftello 
!
!
      call c_ftello ( file % ptr, pos )
!
      return 
      end subroutine f_ftello
!-----------------------------------------------------------------------
!
!     Level 2: 
!
!-----
!-----------------------------------------------------------------------
!
!     New version: 
!        Pass arguments using its reference with value in integer(8),
!        i.e. intptr_t defined in /usr/include/stdint.h
!
!        iptr = (intptr_t) (FILE *) fp
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_ftello_intref ( iptr, pos ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_off_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      integer(kind=ck_off_t),intent(out)     :: pos
!
      external    c_ftello_intref 
!
!
      call c_ftello_intref ( iptr, pos )
!
      return 
      end subroutine f_ftello_intref
!
!-----------------------------------------------------------------------
!
