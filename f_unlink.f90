!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_unlink ( path )
!
      use mod_funx_param, only: ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in) :: path
!
      external    c_unlink 
!
!
      call c_unlink ( path//ck_char_nul )
!
      end subroutine f_unlink
!
!-----------------------------------------------------------------------
