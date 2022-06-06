!------------------------------------------------------------------------
!
!
      subroutine  f_perror ( str, errno )
!
      use mod_funx_param, only: ck_int, ck_char_lf, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)      :: str
      integer(kind=ck_int),intent(in)  :: errno
!
      external    f_geterrno, c_perror
!
!
      call f_geterrno ( errno )
      call c_perror ( str//ck_char_lf//ck_char_nul, errno )
!
      end subroutine f_perror
!
!------------------------------------------------------------------------
