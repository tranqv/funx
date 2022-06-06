!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_chdir ( path )
!
      use mod_funx_param, only: ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in) :: path
!
      external    c_chdir 
!
!
      call c_chdir ( path//ck_char_nul )
!
      end subroutine f_chdir
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
