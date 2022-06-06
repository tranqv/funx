!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
      subroutine  f_fstdin ( file ) 
!
      use mod_funx_param, only: ck_file
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(out) :: file 
!
      external    c_fstdin 
!
!
      call c_fstdin ( file % ptr )
!
      return 
      end subroutine f_fstdin 
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
      subroutine  f_fstdin_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(out) :: iptr
!
      external    c_fstdin_intref 
!
!
      call c_fstdin_intref ( iptr )
!
      return 
      end subroutine f_fstdin_intref 
!-----------------------------------------------------------------------
