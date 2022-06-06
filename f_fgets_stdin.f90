!-----------------------------------------------------------------------
!
!     Get a string from STDIN 
!
!     ERROR Checking:
!        lt = 0      Error, end-of-file. Should skip the reading.
!        lt = lm-1   OK, s writen fully.
!        lt < lm-1   OK, s writen partly, maybe the reading reaches
!                    the newline char(10) or the carriage char(13) at 
!                    the last character of the s.
!
!     Both the cases of reading OK, use s(1:lt) as the output.
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_fgets_stdin ( s, lm, lt ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(in)  :: lm
      character(len=lm),intent(out)    :: s 
      integer(kind=ck_int),intent(out) :: lt
!
      external    c_fgets_stdin
!
!
      call c_fgets_stdin ( s, lm, lt  )
      s ( lt+1 : ) = ''
!
      return 
      end subroutine f_fgets_stdin
!
!-----
!
!     Deprecated!
!
!     We can use F_FGETS_STDIN to pass S directly 
!
      subroutine  f_fgets_stdin_array ( s, lm, lt ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(in)     :: lm
      character,dimension(lm),intent(out) :: s 
      integer(kind=ck_int),intent(out)    :: lt
!
      external    c_fgets_stdin
!
!
      call c_fgets_stdin ( s(1), lm, lt  )
      s ( lt+1 : ) = ''
!
      return 
      end subroutine f_fgets_stdin_array
!
!-----------------------------------------------------------------------
