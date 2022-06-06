!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
      subroutine  f_fstderr ( file ) 
!
      use mod_funx_param, only: ck_file
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(out) :: file 
!
      external    c_fstderr
!
!
      call c_fstderr ( file % ptr )
!
      return 
      end subroutine f_fstderr
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
      subroutine  f_fstderr_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(out) :: iptr 
!
      external    c_fstderr_intref
!
!
      call c_fstderr_intref ( iptr )
!
      return 
      end subroutine f_fstderr_intref
!-----------------------------------------------------------------------
!
!
