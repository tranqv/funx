!-----------------------------------------------------------------------
!
!     Get a byte from a stream
!
!     ERROR Checking:
!
!        c  = ck_eof                                     -->  error (EOF)
!           = some unsinged char (>=0) converted to INT  -->  OK.
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_fgetc ( file, c ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(out) :: c 
!
      external    c_fgetc
!
!
      call c_fgetc ( file % ptr, c )
!
      return 
      end subroutine f_fgetc
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
      subroutine  f_fgetc_intref ( iptr, c ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr     
      integer(kind=ck_int),intent(out)     :: c 
!
      external    c_fgetc_intref
!
!
      call c_fgetc_intref ( iptr, c )
!
      return 
      end subroutine f_fgetc_intref
!
!
!
!
!
