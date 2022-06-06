!-----------------------------------------------------------------------
!
!     Write binary (in byte) to stream
!
!-----------------------------------------------------------------------
!
!     Level 1: interoperating with C directly.
!
!-----
      subroutine  f_fileno ( file, fno ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(out) :: fno 
!
      external    c_fileno
!
!
      call c_fileno ( file % ptr, fno )
!
      return 
      end subroutine f_fileno
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
      subroutine  f_fileno_intref ( iptr, fno ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: fno 
!
      external    c_fileno_intref
!
!
      call c_fileno_intref ( iptr, fno )
!
      return 
      end subroutine f_fileno_intref
!
!
