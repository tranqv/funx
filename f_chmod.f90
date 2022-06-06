!-----------------------------------------------------------------------
!
!     IMPORTANT: 
!     1. all integers are given in decimal presentation. 
!     2. to determine an octal value in decimal presention, we have 
!        to translate. For example, n=777 should become 511 if n is 
!        defined as an octal number. 
!
!     mode of directory is given as an integer with octal value, moct. 
!     For instance, let 
!        moct = 777
!     Without explanation, we always consider moct in decimal mode, i.e.
!        moct = 7x10^2 + 7x10^1 + 7 
!     However, calling funx_chmod ( path, moct, errno ) implies 
!        moct = 7x8^2 + 7x8^1 + 7 = 511
!     So, we have to translate moct=777 to 511 using funx_dec2oct.
!     Thus, in fact, we will perform 
!        call funx_chmod ( path, 511, errno )
!     The c_chmod will read 511 as 777 in octal presentation, as designed.
!-----------------------------------------------------------------------
!
!     Level 1: it has the highest responsible.
!
!-----
!
!     mode of directory is given as mdec with decimal value.
!
      subroutine  f_chmod_decf ( path, mdec )
! 
      use mod_funx_param, only: ck_char_nul, ck_mode_t 
      implicit none
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: mdec
!
      external    c_chmod
!
!
      call c_chmod ( path//ck_char_nul, mdec )
!
      end subroutine f_chmod_decf
!
!-----
!
      subroutine  f_chmod_octf ( path, moct )
!  
      use mod_funx_param, only: ck_int, ck_mode_t 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: moct
!
      external    f_chmod_decf, f_utils_oct2dec 
      integer(kind=ck_mode_t)    mdec
!
!
      call f_utils_oct2dec ( moct, mdec )
      call f_chmod_decf ( path, mdec )
!
      end subroutine f_chmod_octf 
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
      subroutine  f_chmod_perm ( path, perm )
!  
      use mod_funx_param, only: ck_int, ck_mode_t 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)      :: path
      character(len=*),intent(in)      :: perm 
!
      external    f_chmod_decf, f_utils_per2dec 
      integer(kind=ck_mode_t)    mdec 
!
!
      call f_utils_per2dec ( perm, mdec )
      call f_chmod_decf ( path, mdec )
!
      end subroutine f_chmod_perm 
!
!-----
!
      subroutine  f_chmod ( path, mdec )
!  
      use mod_funx_param, only: ck_int, ck_mode_t 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: mdec
!
      external    f_chmod_decf
!
      call f_chmod_decf ( path, mdec )
!
      end subroutine f_chmod
!
!-----------------------------------------------------------------------
