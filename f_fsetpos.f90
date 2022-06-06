!-----------------------------------------------------------------------
!
!     Set STREAM's position.
!        istat =  0        if OK, 
!              =  nonzero  on error.
!
!     Introduced by ISO C standard.
!
!     NOTE: ck_fpos_t=16, enable to work with extremely large files
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
!
      subroutine  f_fsetpos ( file, pos ) 
!
      use mod_funx_param, only: ck_file, ck_fpos_t
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_fpos_t),intent(in)  :: pos
!
      external    c_fsetpos 
!
!
      call c_fsetpos ( file % ptr, pos )
!
      return 
      end subroutine f_fsetpos
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
!        iptr = (intptr_t) (FILE *) fp
!
!-----
!
      subroutine  f_fsetpos_intref ( iptr, pos ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_fpos_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_fpos_t),intent(in)     :: pos
!
      external    c_fsetpos_intref 
!
!
      call c_fsetpos_intref ( iptr, pos )
!
      return 
      end subroutine f_fsetpos_intref
!
!
