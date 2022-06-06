!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
!
      subroutine  f_fstdout ( file ) 
!
      use mod_funx_param, only: ck_file
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout) :: file 
!
      external    c_fstdout
!
!
      call c_fstdout ( file % ptr )
!
      return 
      end subroutine f_fstdout
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
      subroutine  f_fstdout_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(inout) :: iptr 
!
      external    c_fstdout_intref
!
!
      call c_fstdout_intref ( iptr )
!
      return 
      end subroutine f_fstdout_intref
!
!-----------------------------------------------------------------------
