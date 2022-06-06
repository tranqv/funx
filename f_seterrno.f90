!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_seterrno ( errc )
!
      use mod_funx_param, only: ck_int 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(in) :: errc
      external    c_seterrno
!
      call c_seterrno ( errc )
!
      end subroutine f_seterrno
!
!-----------------------------------------------------------------------
