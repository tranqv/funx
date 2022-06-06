!
!  ./a.out  644
!
!
      program  t_oct2per 

      use my_funx 
      implicit none
!
!     include  'i_param.inc'
!
      character(len=90) :: arg1
      character(len=90) :: str 
      integer(ck_mode_t)  ioct 
      integer(ck_int)     errno
      integer(ck_size_t)  len_arg1, lentrim_arg1
!     external    funx_getarg, funx_oct2per
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. ./a.out  511"
         stop
      else 
         print *, 'ioct =' // arg1(1:lentrim_arg1) 
      endif 

      read( arg1, * ) ioct 

      call funx_oct2per ( ioct, str )

      print *, 'perm =', trim(str) 

      end program 
