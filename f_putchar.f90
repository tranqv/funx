!-----------------------------------------------------------------------
!
!     Put a byte on STDOUT stream
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_putchar ( c, istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(in)  :: c 
      integer(kind=ck_int),intent(out) :: istat 
!
      external    c_putchar
!
!
      call c_putchar ( c, istat )
!
      return 
      end subroutine f_putchar
!
!-----------------------------------------------------------------------
