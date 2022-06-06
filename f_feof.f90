!-----------------------------------------------------------------------
!
!     return: istat = nonzero (true)  if end of file on stream, 
!                   = 0       (false) otherwise.
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_feof ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)      :: file 
      integer(kind=ck_int),intent(out) :: istat
!
      external    c_feof 
!
!
      call c_feof ( file % ptr, istat ) 
!
      return 
      end subroutine f_feof
!
!-----------------------------------------------------------------------
!
!     Level 2:
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
!-----
!
      subroutine  f_feof_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: istat
!
      external    c_feof_intref
!
!
      call c_feof_intref ( iptr, istat ) 
!
      return 
      end subroutine f_feof_intref
!
!-----------------------------------------------------------------------
