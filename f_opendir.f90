!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_opendir ( dirname, dir )
!
      use mod_funx_param, only: ck_dir, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)      :: dirname
      type(ck_dir),intent(inout)       :: dir
!
      external    c_opendir 
!
      call c_opendir ( dirname//ck_char_nul, dir % ptr )
!
      end subroutine f_opendir
!
!-----------------------------------------------------------------------
!
!     New version: 
!        Pass arguments using its reference with value in integer(8), i.e.  
!        intptr_t defined in /usr/include/stdint.h
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_opendir_intref ( dirname, iptr )
!
      use mod_funx_param, only: ck_intptr_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)            :: dirname
      integer(kind=ck_intptr_t),intent(out)  :: iptr 
!
      external    c_opendir_intref  
!
      call c_opendir_intref ( dirname//ck_char_nul, iptr )
!     print '(" iptr =", i15)', iptr 
!
      end subroutine f_opendir_intref
!
!-----------------------------------------------------------------------
