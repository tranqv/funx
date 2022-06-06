!-----------------------------------------------------------------------
!
!     Put a byte on STDERR
!
!     ERROR Checking:
!
!        istat = ck_eof    error (EOF)
!              = ichar(c)  OK
!
!-----------------------------------------------------------------------
!
!     Level 1: interoperating with C directly.
!
!-----
!
      subroutine  f_fputc_stderr ( c, istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external    c_fputc_stderr
      integer(kind=ck_int)    ich
!
!     Converting C (character(1), 1 byte) into ICH (integer, 4 bytes):
!
      ich = ichar(c)
      call c_fputc_stderr ( ich, istat )
!
      return 
      end subroutine f_fputc_stderr 
!
!-----------------------------------------------------------------------
