!
!  ./a.out  tmp1 
!
   program  t_rmpath_01 

   use my_funx 
   implicit none
!
!  include  'i_param.inc'
!
   character(len=1024)  arg1
   integer(ck_int)      errno
   integer(ck_size_t)   len_arg1, lentrim_arg1
!  external    funx_getarg, funx_perror, funx_rmpath  
!
!
   len_arg1 = len(arg1)

   lentrim_arg1 = -1 
   call funx_getarg ( 1, arg1, lentrim_arg1, errno )


   if ( lentrim_arg1 .lt. 0 ) then
      print *, "ERROR: input argument. ./a.out  /path/to/folder "
      stop
   else 
      print *, 'arg1 =' // arg1(1:lentrim_arg1) // '<- Directory name'
   endif 

   call funx_rmpath ( arg1(1:lentrim_arg1), errno )

   call funx_perror ( 't_rmpath_01', errno )

   end program 
