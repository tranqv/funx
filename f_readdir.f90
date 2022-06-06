!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
! 
      subroutine  f_readdir (                           &
                  dir, fname, size_fname, lentrim_fname )
!
      use mod_funx_param, only: ck_dir, ck_size_t 
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_dir),intent(inout)              :: dir
      integer(kind=ck_size_t),intent(in)      :: size_fname
      character(len=size_fname),intent(inout) :: fname
      integer(kind=ck_size_t),intent(out)     :: lentrim_fname
!
      external    c_readir 
!
!
      call c_readdir ( dir % ptr, fname, size_fname, lentrim_fname )
      if ( lentrim_fname .gt. 0 ) fname(lentrim_fname+1:size_fname) = ''
!
      end subroutine f_readdir
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
      subroutine  f_readdir_intref (                     &
                  iptr, fname, size_fname, lentrim_fname )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)    :: iptr 
      integer(kind=ck_size_t),intent(in)      :: size_fname
      character(len=size_fname),intent(inout) :: fname
      integer(kind=ck_size_t),intent(out)     :: lentrim_fname
!
      external    c_readir_intref
!
!
      call c_readdir_intref ( iptr, fname, size_fname, lentrim_fname )
      if ( lentrim_fname .gt. 0 ) fname(lentrim_fname+1:size_fname) = ''
!
      end subroutine f_readdir_intref
!
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!

