!-----------------------------------------------------------------------
!
!     flush a stream 
!
!        istat = 0         success
!              = -1 (EOF)  error.
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_fflush ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)      :: file 
      integer(kind=ck_int),intent(out) :: istat
!
      external    c_fflush 
!
!
      call c_fflush ( file % ptr, istat ) 
!
      return 
      end subroutine f_fflush
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
      subroutine  f_fflush_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr     
      integer(kind=ck_int),intent(out)     :: istat
!
      external    c_fflush_intref
!
!
      call c_fflush_intref ( iptr, istat ) 
!
      return 
      end subroutine f_fflush_intref
!
!
!-----------------------------------------------------------------------
