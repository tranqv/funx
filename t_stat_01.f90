!
!  ./a.out  path/to/file
!
   program  t_stat_01 
!
   use my_funx 
   implicit none
!
!  include  'i_param.inc'
!
   character(len=ck_name_max)    arg1
   integer(ck_int)      errno
   integer(ck_size_t)   len_arg1, lentrim_arg1
   type(ck_stat)        fstat
!
!  external    funx_getarg, funx_perror, funx_stat, funx_stat_print 
!
!
   len_arg1 = len(arg1)

   lentrim_arg1 = -1 
   call funx_getarg ( 1, arg1, lentrim_arg1, errno )

   if ( lentrim_arg1 .lt. 0 ) then
      print *, "ERROR: input argument. ./a.out  /path/to/file "
      stop
   else 
      print *, 'arg1   =' // arg1(1:lentrim_arg1) // '<- File name'
   endif 

   call funx_stat ( arg1(1:lentrim_arg1), fstat, errno )

   call funx_stat_print ( fstat )  

   call funx_perror ( 't_stat_01', errno )

   end program 
!
!
!
