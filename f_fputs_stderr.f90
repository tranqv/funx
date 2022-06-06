!-----------------------------------------------------------------------
!
!     Put a string on STDERR 
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
      subroutine  f_fputs_stderr ( s, ls, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)  :: ls
      character(len=ls),intent(in)        :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external    c_fputs_stderr 
!
!     fputs() function work with NULL-terminated strings
!
      call c_fputs_stderr ( s(1:ls)//ck_char_nul, istat )
!
      return 
      end subroutine f_fputs_stderr 
!
!-----
!
!     Deprecated!
!
!     We can use F_FPUTS_STDERR to pass S directly and not need to adopt 
!     the transmission STMP
!
      subroutine  f_fputs_stderr_array ( s, ls, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t, ck_char_nul, ck_size_t 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)  :: ls
      character,dimension(ls),intent(in)  :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external                   c_fputs_stderr 
      character(len=ls+1)        stmp
      integer(kind=ck_size_t)    i
!
!
      do concurrent ( i = 1:ls ) 
         stmp(i:i) = s(i) 
      enddo 
      stmp(ls+1:ls+1) = ck_char_nul
      call c_fputs_stderr ( stmp, istat )
!
      return 
      end subroutine f_fputs_stderr_array 
!
!-----------------------------------------------------------------------
