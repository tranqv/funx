!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_geterrno ( ier ) 
!
      use mod_funx_param, only: ck_int  
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(out) :: ier
      external    c_geterrno
!
      call c_geterrno ( ier )
!
      end subroutine f_geterrno
!
!-----------------------------------------------------------------------
