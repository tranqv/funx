!-----------------------------------------------------------------------
!
!     Put a byte on a stream
!
!     ERROR Checking:
!
!        istat = ck_eof    error (EOF)
!              = ichar(c)  OK
!
!-----------------------------------------------------------------------
!
!     Level 1: interoperating with C directly.
!
!-----
!
      subroutine  f_putc ( file, c, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)         :: file 
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external    c_putc
      integer(kind=ck_int)    ich
!
!     Converting C (character(1), 1 byte) into ICH (integer, 4 bytes):
!
      ich = ichar(c)
      call c_putc ( file % ptr, ich, istat )
!
      return 
      end subroutine f_putc
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
      subroutine  f_putc_intref ( iptr, c, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external    c_putc_intref
      integer(kind=ck_int)    ich
!
!     Converting C (character(1), 1 byte) into ICH (integer, 4 bytes):
!
      ich = ichar(c)
      call c_putc_intref ( iptr, ich, istat )
!
      return 
      end subroutine f_putc_intref
!
!-----------------------------------------------------------------------
!
