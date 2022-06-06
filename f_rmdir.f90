!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_rmdir ( path )
!
      use mod_funx_param, only: ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in) :: path
!
      external    c_rmdir 
!
!
      call c_rmdir ( path//ck_char_nul )
!
      end subroutine f_rmdir
!
!-----------------------------------------------------------------------
