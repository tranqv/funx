!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
!
      subroutine  f_clock ( dtime_in_sec )
!
      use mod_funx_param, only: ck_double 
      implicit none 
!
!     include     'i_param.inc'
!
      real(kind=ck_double),intent(inout) :: dtime_in_sec
!
      external    c_clock
!
!
      call c_clock ( dtime_in_sec )
!
      end subroutine f_clock 
!
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!

