!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_rewinddir ( dir )
!
      use mod_funx_param, only: ck_dir
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_dir),intent(inout) :: dir
!
      external    c_rewinddir 
!
!
      call c_rewinddir ( dir % ptr )
!
      end subroutine f_rewinddir
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
      subroutine  f_rewinddir_intref ( iptr )
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr
!
      external    c_rewinddir_intref 
!
!
      call c_rewinddir_intref ( iptr )
!
      end subroutine f_rewinddir_intref
!
!-----------------------------------------------------------------------
