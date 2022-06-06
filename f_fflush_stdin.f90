!-----------------------------------------------------------------------
!
!     flush STDIN
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
      subroutine  f_fflush_stdin ( istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(out) :: istat
!
      external    c_fflush_stdin 
!
!
      call c_fflush_stdin ( istat ) 
!
      return 
      end subroutine f_fflush_stdin
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!
!
!
!
