!------------------------------------------------------------------------------
!
!     lstat = .true.    if file is associated to some stream, 
!           = .false.   otherwise.
!
!-----------------------------------------------------------------------
!
!     Level 1: interoperating with C directly.
!
!-----
!
      subroutine  f_finuse ( file, lstat )
!
      use mod_funx_param, only: ck_file, ck_icha_nul
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)   :: file 
      logical,intent(out)        :: lstat
!
!     ck_icha_nul = ichar('\0') = ichar(NULL).
!
      lstat = ( file % ptr .ne. ck_icha_nul )
!
      return 
      end subroutine f_finuse
!
!-----------------------------------------------------------------------
!
!     Level 2: 
!
!-----
!
!
!-----------------------------------------------------------------------
!
!     New version: 
!        Pass arguments using its reference with value in integer(8),
!        i.e. intptr_t defined in /usr/include/stdint.h
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_finuse_intref ( iptr, lstat )
!
      use mod_funx_param, only: ck_intptr_t, ck_icha_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      logical,intent(out)                    :: lstat
!
!     ck_icha_nul = ichar('\0') = ichar(NULL).
!
      lstat = ( iptr .ne. ck_icha_nul )
!
      return 
      end subroutine f_finuse_intref
!
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!


