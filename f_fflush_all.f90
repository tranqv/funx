!-----------------------------------------------------------------------
!
!     flush all current streams
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
      subroutine  f_fflush_all ( istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(out) :: istat
!
      external    c_fflush_all 
!
!
      call c_fflush_all ( istat ) 
!
      return 
      end subroutine f_fflush_all
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!
!
!
!
!-----------------------------------------------------------------------
