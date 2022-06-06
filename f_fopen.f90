!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_fopen ( file, path, mode ) 
!
      use mod_funx_param, only: ck_file, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(out)   :: file 
      character(len=*),intent(in) :: path, mode
!
      external    c_fopen 
!
!
      call c_fopen ( file % ptr, path//ck_char_nul, mode//ck_char_nul )
!
      return 
      end subroutine f_fopen
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
!        Pass arguments using its reference with value in integer(8), i.e.  
!        intptr_t defined in /usr/include/stdint.h
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_fopen_intref ( iptr, path, mode ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(out) :: iptr
      character(len=*),intent(in) :: path, mode
!
      external    c_fopen_intref
!
!
      call c_fopen_intref ( iptr, path//ck_char_nul, mode//ck_char_nul )
!
      return 
      end subroutine f_fopen_intref
!
!-----------------------------------------------------------------------

!-----------------------------------------------------------------------
!
!
