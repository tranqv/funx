!-----------------------------------------------------------------------
!
!     Put a string on a stream
!
!     ERROR Checking:
!
!        istat = ck_eof                   Error (EOF)
!              = a non-negative number    OK
!
!-----------------------------------------------------------------------
!
!     Level 1: interoperating with C directly.
!
!-----
!
      subroutine  f_fputs ( file, s, ls, istat ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_size_t),intent(in)  :: ls
      character(len=ls),intent(in)        :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external    c_fputs
!
!     fputs() function work with NULL-terminated strings
!
      call c_fputs ( file % ptr, s(1:ls)//ck_char_nul, istat )
!
      return 
      end subroutine f_fputs
!
!-----
!
!     Deprecated!
!
!     We can use F_FPUTS_STDOUT to pass S and not need to adopt 
!     the transmission STMP
!
      subroutine  f_fputs_array ( file, s, ls, istat ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_size_t),intent(in)  :: ls
      character,dimension(ls),intent(in)  :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external                   c_fputs
      character(len=ls+1)        stmp
      integer(kind=ck_size_t)    i
!
!
      do concurrent ( i = 1:ls ) 
         stmp(i:i) = s(i) 
      enddo 
!
!     fputs() function work with NULL-terminated strings
!
      stmp(ls+1:ls+1) = ck_char_nul
!
      call c_fputs ( file % ptr, stmp, istat )
!
      return 
      end subroutine f_fputs_array
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
      subroutine  f_fputs_intref ( iptr, s, ls, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      integer(kind=ck_size_t),intent(in)     :: ls
      character(len=ls),intent(in)           :: s 
      integer(kind=ck_int),intent(out)       :: istat  
!
      external    c_fputs_intref
!
!     fputs() function work with NULL-terminated strings
!
      call c_fputs_intref ( iptr, s(1:ls)//ck_char_nul, istat )
!
      return 
      end subroutine f_fputs_intref
!
!-----
!
!     Deprecated!
!
!     We can use F_FPUTS_STDOUT to pass S and not need to adopt 
!     the transmission STMP
!
!
      subroutine  f_fputs_intref_array ( iptr, s, ls, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      integer(kind=ck_size_t),intent(in)     :: ls
      character,dimension(ls),intent(in)     :: s 
      integer(kind=ck_int),intent(out)       :: istat  
!
      external                   c_fputs_intref
      character(len=ls+1)        stmp 
      integer(kind=ck_size_t)    i
!
!
      do concurrent ( i = 1:ls ) 
         stmp(i:i) = s(i) 
      enddo 
!
!     fputs() function work with NULL-terminated strings
!
      stmp(ls+1:ls+1) = ck_char_nul
!
      call c_fputs_intref ( iptr, stmp, istat )
!
      return 
      end subroutine f_fputs_intref_array 
!-----------------------------------------------------------------------
!
