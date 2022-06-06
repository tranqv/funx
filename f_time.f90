!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_time ( time ) 
!
      use mod_funx_param, only: ck_time_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_time_t),intent(out) :: time 
!
      external    c_time 
!
!
      call c_time ( time ) 
!
      return 
      end subroutine f_time
!
!-----------------------------------------------------------------------
!
