!-----------------------------------------------------------------------
!
!     Put a string on STDOUT 
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
      subroutine  f_fputs_stdout ( s, ls, istat ) 
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
      external    c_fputs_stdout 
!
!     fputs() function work with NULL-terminated strings
!
      call c_fputs_stdout ( s(1:ls)//ck_char_nul, istat )
!
      return 
      end subroutine f_fputs_stdout 
!
!-----
!
!     Deprecated!
!
!     We can use F_FPUTS_STDOUT to pass S directly and not need to adopt
!     the transmission STMP
!
      subroutine  f_fputs_stdout_array ( s, ls, istat ) 
!
      use mod_funx_param, only: ck_int, ck_char_nul, ck_size_t 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)  :: ls
      character,dimension(ls),intent(in)  :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external                   c_fputs_stdout
      character(len=ls+1)        stmp
      integer(kind=ck_size_t)    i
!
!
      do concurrent ( i = 1:ls ) 
         stmp(i:i) = s(i) 
      enddo 
      stmp(ls+1:ls+1) = ck_char_nul
      call c_fputs_stdout ( stmp, istat )
!
      return 
      end subroutine f_fputs_stdout_array 
!
!-----------------------------------------------------------------------
