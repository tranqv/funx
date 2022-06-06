!-----------------------------------------------------------------------
!
!     Get a byte from STDIN 
!
!     ERROR Checking:
!
!        c  = ck_eof                                     -->  error (EOF)
!           = some unsinged char (>=0) converted to INT  -->  OK.
!
!-----
      subroutine  f_fgetc_stdin ( c ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(out) :: c 
!
      external    c_fgetc_stdin
!
!
      call c_fgetc_stdin ( c )
!
      return 
      end subroutine f_fgetc_stdin 
!
!-----------------------------------------------------------------------
