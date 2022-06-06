!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
!     (default)
!     Mode of directory is given as an integer with decimal value.
!
      subroutine  f_mkdir_decf ( path, mdec )
! 
      use mod_funx_param, only: ck_mode_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: mdec
!
      external    c_mkdir_decf 
!
!
      call c_mkdir_decf ( path//ck_char_nul, mdec )
      return 
      end subroutine f_mkdir_decf
!
!-----
!
!     Mode of directory is given as an integer with decimal value.
!
      subroutine  f_mkdir_octf ( path, moct )
! 
      use mod_funx_param, only: ck_mode_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)        :: path
      integer(kind=ck_mode_t),intent(in) :: moct
!
      external    c_mkdir_octf 
!
!
      call c_mkdir_octf ( path//ck_char_nul, moct )
      return 
      end subroutine f_mkdir_octf
!
!-----
!
!     Next, let us define subroutine working with mask in the character
!     form:
!           
!           123456789
!           ---------
!     fmt= 'rwxrwxrwx'
!           ---___---         
!            U  G  O       U:user, G:group, O:others
!
!     For example, with the input mask
!
!     fmt = 'rwxr--r--'
!
!     the output directory has persission: 
!     +  User (onwer) can read, write, execute
!     +  Group can read only.
!     +  Others can only read.
!
!
      subroutine  f_mkdir_perm ( path, perm )
! 
      use mod_funx_param, only: ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in) :: path
      character(len=*),intent(in) :: perm 
!
      external    c_mkdir_perm  
!
!
      call c_mkdir_perm ( path//ck_char_nul, perm//ck_char_nul )
      return 
      end subroutine f_mkdir_perm 
!
!-----------------------------------------------------------------------
