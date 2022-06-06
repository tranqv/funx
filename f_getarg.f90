!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_getarg ( k, arg, lentrim_arg )
!
      use mod_funx_param, only: ck_size_t, ck_int 
      implicit none 
!
!     include     'i_param.inc'
!
      integer,intent(in)                  :: k
      character(len=*),intent(out)        :: arg
      integer(kind=ck_size_t),intent(out) :: lentrim_arg
!
      intrinsic   getarg
      intrinsic   iargc
      integer     iargc
!
!
      lentrim_arg = -1  
      if ( (k .lt. 0) .or. (k .gt. iargc()) ) return 
      call getarg ( k, arg )
      lentrim_arg = len_trim(arg)
      return 
      end subroutine f_getarg
!
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----
!
