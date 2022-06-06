!-----------------------------------------------------------------------
!
!     Write binary (in byte) to stream
!
!-----------------------------------------------------------------------
!
!     Level 1: interoperating with C directly.
!
!-----------------------------------------------------------------------
!
!     Hint: 
!
!     1. Code using array of chacracter (e.g. character s(.)) when 
!     compiled with 
!        -O3 -fstack-arrays -finit-local-zero
!     can run very fast in comparison with character(len=.).
!
!-----------------------------------------------------------------------
!
      subroutine  f_fwrite_astr ( &
                  file, astr, len_astr, m ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)               :: file 
      integer(kind=ck_size_t),intent(in)     :: len_astr
      character(len=len_astr),intent(in)     :: astr 
      integer(kind=ck_size_t),intent(out)    :: m 
!
      external    c_fwrite_astr
!
!
      call c_fwrite_astr ( file % ptr, astr, len_astr, m )
!
      return 
      end subroutine f_fwrite_astr
!
!-----
!     Deprecated!
!
      subroutine  f_fwrite_astr_array ( &
                  file, astr, len_astr, m ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)                  :: file 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(in)  :: astr 
      integer(kind=ck_size_t),intent(out)       :: m 
!
      external    c_fwrite_astr
!
!
      call c_fwrite_astr ( file % ptr, astr(1), len_astr, m )
!
      return 
      end subroutine f_fwrite_astr_array
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
      subroutine  f_fwrite_astr_intref ( &
                  iptr, astr, len_astr, m ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_size_t),intent(in)     :: len_astr
      character(len=len_astr),intent(in)     :: astr 
      integer(kind=ck_size_t),intent(out)    :: m 
!
      external    c_fwrite_astr_intref
!
!
      call c_fwrite_astr_intref ( iptr, astr, len_astr, m )
!
      return 
      end subroutine f_fwrite_astr_intref
!
!-----
!
!     Deprecated!
!
      subroutine  f_fwrite_astr_intref_array ( &
                  iptr, astr, len_astr, m ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)      :: iptr 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(in)  :: astr 
      integer(kind=ck_size_t),intent(out)       :: m 
!
      external    c_fwrite_astr_intref
!
!
      call c_fwrite_astr_intref ( iptr, astr(1), len_astr, m )
!
      return 
      end subroutine f_fwrite_astr_intref_array
!-----------------------------------------------------------------------










!
!
!
