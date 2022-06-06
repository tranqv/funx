!-----------------------------------------------------------------------
!
!     Get a byte from STDIN stream
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_getchar ( c ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(out) :: c 
!
      external    c_getchar
!
!
      call c_getchar ( c )
      return 
      end subroutine f_getchar
!
!-----------------------------------------------------------------------
