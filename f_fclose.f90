!-----------------------------------------------------------------------
!
!     fclose - close a stream
!     Returns: istat =
!        0           if OK,
!        EOF (= -1)  on error 
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_fclose ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(out) :: istat 
!
      external    c_fclose 
!
!
      call c_fclose ( file % ptr, istat )
!
      return 
      end subroutine f_fclose
!
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
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
      subroutine  f_fclose_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: istat 
!
      external    c_fclose_intref 
!
!
      call c_fclose_intref ( iptr, istat )
!
      return 
      end subroutine f_fclose_intref
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!
!
!
!
