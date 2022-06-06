!-----------------------------------------------------------------------
!
!     Write binary (in byte) to stream
!
!-----------------------------------------------------------------------
!
!     Level 1: interoperating with C directly.
!
!-----
      subroutine  f_fwrite_afloat ( file, ar, n, m )
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_float
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)                     :: file 
      integer(kind=ck_size_t),intent(in)           :: n 
      real(kind=ck_float),dimension(n),intent(in)  :: ar 
      integer(kind=ck_size_t),intent(out)          :: m
!
      external    c_fwrite_afloat
!
!
      call c_fwrite_afloat ( file % ptr, ar, n, m )
!
      return 
      end subroutine f_fwrite_afloat
!
!-----------------------------------------------------------------------
!
!     New version: 
!        Pass arguments using its reference with value in integer(8), i.e.  
!        intptr_t defined in /usr/include/stdint.h
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_fwrite_afloat_intref ( iptr, ar, n, m )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_float
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)         :: iptr
      integer(kind=ck_size_t),intent(in)           :: n 
      real(kind=ck_float),dimension(n),intent(in)  :: ar 
      integer(kind=ck_size_t),intent(out)          :: m
!
      external    c_fwrite_afloat_intref
!
!
      call c_fwrite_afloat_intref ( iptr, ar, n, m )
!
      return 
      end subroutine f_fwrite_afloat_intref
!
!-----------------------------------------------------------------------
