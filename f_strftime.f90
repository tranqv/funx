!------------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_strftime ( &
                  rawtime, str, len_str, lentrim_str ) 
!
      use mod_funx_param, only: ck_time_t, ck_size_t
      implicit none 
!
!     include  'i_param.inc'
!
      integer(kind=ck_time_t),intent(in)     :: rawtime  
      integer(kind=ck_size_t),intent(in)     :: len_str
      character(len=len_str),intent(inout)   :: str
      integer(kind=ck_size_t),intent(out)    :: lentrim_str
!
      external    c_strftime 
!
!
      call c_strftime ( rawtime, str, len_str, lentrim_str )
      str ( lentrim_str+1 : len_str ) = ''
!
      return 
      end subroutine f_strftime
!
!------------------------------------------------------------------------
