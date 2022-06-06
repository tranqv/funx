!
!  ./a.out  tmp1 777
!  ./a.out  tmp1 644
!
!
   program  t_strftime_01 

   use my_funx 
   implicit none
!
!  include  'i_param.inc'
!
   character(len=28) :: arg1, str 
   integer(ck_time_t)   itime 
   integer(ck_int)      errno
   integer(ck_size_t)   len_arg1, lentrim_arg1, len_str, lentrim_str
!  external    funx_getarg, funx_perror, funx_strftime  
!
!
   len_arg1 = len(arg1)

   lentrim_arg1 = -1 
   call funx_getarg ( 1, arg1, lentrim_arg1, errno )

   if ( lentrim_arg1 .lt. 0 ) then
      print *, "ERROR: input argument. ./a.out  1583906261 "
      stop
   else 
      read( arg1(1:lentrim_arg1), * ) itime 
      print *, 'itime =', itime, '<-- raw time imput'
   endif 

   len_str = len(str) 

   call funx_strftime ( itime, str, len_str, lentrim_str, errno )

   print *, 'str =' // str(1:lentrim_str) // '<-- time in readable format'

   call funx_perror ( 't_strftime_01', errno )

   end program 
