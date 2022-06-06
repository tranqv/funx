!-----------------------------------------------------------------------
!
!     flush STDERR
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
      subroutine  f_fflush_stderr ( istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(out) :: istat
!
      external    c_fflush_stderr 
!
!
      call c_fflush_stderr ( istat ) 
!
      return 
      end subroutine f_fflush_stderr
!
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!
!
!
!
