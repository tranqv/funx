!-----------------------------------------------------------------------
!
!     Output: pos = current file position indicator if OK, -1 on error.
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
      subroutine  f_ftell ( file, pos ) 
!
      use mod_funx_param, only: ck_file, ck_long 
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_long),intent(out)   :: pos
!
      external    c_ftell 
!
!
      call c_ftell ( file % ptr, pos )
!
      return 
      end subroutine f_ftell
!
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
      subroutine  f_ftell_intref ( iptr, pos ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_long 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      integer(kind=ck_long),intent(out)      :: pos
!
      external    c_ftell_intref 
!
!
      call c_ftell_intref ( iptr, pos )
!
      return 
      end subroutine f_ftell_intref
!
!
!
