!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_strerror ( &
                  err, str, size_str, lentrim_str, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),intent(in)     :: err
      integer(kind=ck_size_t),intent(in)  :: size_str
      character(len=size_str),intent(out) :: str 
      integer(kind=ck_size_t),intent(out) :: lentrim_str
      integer(kind=ck_int),intent(out)    :: errno
!
      external    c_strerror
!
!
      lentrim_str = -1 
      call c_strerror ( err, str, size_str, lentrim_str, errno )
      if ( lentrim_str .gt. 0 ) str ( lentrim_str+1 : size_str ) = ''
!   
      end subroutine f_strerror
!
!-----------------------------------------------------------------------
