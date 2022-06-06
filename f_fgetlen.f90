!-----------------------------------------------------------------------
!
!     Returns: len = the length of stream.
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_fgetlen ( file, len ) 
!
      use mod_funx_param, only: ck_file, ck_long
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_long),intent(out)   :: len
!
      external    c_fgetlen 
!
!
      call c_fgetlen ( file % ptr, len )
!
      return 
      end subroutine f_fgetlen
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
      subroutine  f_fgetlen_intref ( iptr, len ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_long
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_long),intent(out)    :: len
!
      external    c_fgetlen_intref 
!
!
      call c_fgetlen_intref ( iptr, len )
!
      return 
      end subroutine f_fgetlen_intref
!
!
