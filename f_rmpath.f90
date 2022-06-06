!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_rmpath ( path )
!
      use mod_funx_param, only: ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in) :: path
!
      external    c_rmpath 
!
!
      call c_rmpath ( path//ck_char_nul )
!
      end subroutine f_rmpath
!
!-----------------------------------------------------------------------
