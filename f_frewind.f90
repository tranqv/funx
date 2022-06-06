!-----------------------------------------------------------------------
!
!     Rewind to the beginning of STREAM
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
      subroutine  f_frewind ( file ) 
!
      use mod_funx_param, only: ck_file 
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in) :: file 
!
      external    c_frewind 
!
!
      call c_frewind ( file % ptr )
!
      return 
      end subroutine f_frewind
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
!-----
!
      subroutine  f_frewind_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
!
      external    c_frewind_intref 
!
!
      call c_frewind_intref ( iptr )
!
      return 
      end subroutine f_frewind_intref
!
!
