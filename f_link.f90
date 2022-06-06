!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_link ( src, des )
!
      use mod_funx_param, only: ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)      :: src, des
!
      external    c_link 
!
!
      call c_link ( src//ck_char_nul, des//ck_char_nul )
! 
      end subroutine f_link
!
!-----------------------------------------------------------------------
