!-----------------------------------------------------------------------
!
!     To convert a time value (TIM) to a date and time string (STR)
!     of the form "Day Mon dd hh:mm:ss yyyy"
!
!     Ex: TIM = 1583171848  -->  STR = 'Mon Mar  2 18:01:04 2020'
!
!-----------------------------------------------------------------------
!
!     Level 1: 
!
!-----
!
      subroutine  f_ctime ( tim, str, len_str, lentrim_str )
!
      use mod_funx_param, only: ck_time_t, ck_size_t, ck_int  
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_time_t),intent(in)     :: tim
      integer(kind=ck_size_t),intent(in)     :: len_str
      character(len=len_str),intent(inout)   :: str 
      integer(kind=ck_size_t),intent(out)    :: lentrim_str
!
      external    c_ctime
!
!
      lentrim_str = -1 
      call c_ctime ( tim, str, len_str, lentrim_str )
      str ( lentrim_str+1 : len_str ) = ''
!
      end subroutine f_ctime
!-----------------------------------------------------------------------
!
!     Level 2: 
!
!-----
!
