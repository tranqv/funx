!-----------------------------------------------------------------------
!
!     Close a stream opened by popen and return the status of its child.
!     istat = the termination status of 
!             the command language interpreter,    if OK, 
!           = -1                                   if error.
!     
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
      subroutine  f_pclose ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)      :: file 
      integer(kind=ck_int),intent(out) :: istat 
!
      external    c_pclose 
!
!
      call c_pclose ( file % ptr, istat )
!
      return 
      end subroutine f_pclose
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
      subroutine  f_pclose_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: istat 
!
      external    c_pclose_intref 
!
!
      call c_pclose_intref ( iptr, istat )
!
      return 
      end subroutine f_pclose_intref
!
!-----------------------------------------------------------------------
