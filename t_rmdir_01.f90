!
!  ./a.out  tmp1 
!
   program  t_rmdir_01 

   use my_funx 
   implicit none

!  include  'i_param.inc'

   character(len=90) :: arg1
   integer(4)  errno
   integer(8)  len_arg1, lentrim_arg1
!  external    funx_getarg, funx_perror, funx_rmdir  
!
!
   len_arg1 = len(arg1)

   lentrim_arg1 = -1 
   call funx_getarg ( 1, arg1, lentrim_arg1, errno )


   if ( lentrim_arg1 .lt. 0 ) then
      print *, "ERROR: input argument. ./a.out  ./tmp1 "
      stop
   else 
      print *, 'arg1 =' // arg1(1:lentrim_arg1) // '<- Directory name'
   endif 

   call funx_rmdir ( arg1(1:lentrim_arg1), errno )

   call funx_perror ( 't_rmdir_01', errno )

   end program 
