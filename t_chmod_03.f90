!
!  ./a.out  tmp1 'rwxrwxrwx'
!  ./a.out  tmp1 'rwxr-xr-x'
!
   program  t_chmod_03 

   use mod_funx_param 
   use mod_funx_faces

   implicit none

!  include  'i_param.inc'

   character(len=90) :: arg1, arg2
   integer(ck_int)      errno
!  integer(ck_mode_t)   imode
   integer(ck_size_t)   &
      len_arg1, lentrim_arg1, &
      len_arg2, lentrim_arg2   
!  external    funx_getarg, funx_perror, funx_chmod_perm  
!
!
   len_arg1 = len(arg1)
   len_arg2 = len(arg2)

   lentrim_arg1 = -1 
   call funx_getarg ( 1, arg1, lentrim_arg1, errno )

   lentrim_arg2 = -1 
   call funx_getarg ( 2, arg2, lentrim_arg2, errno )



   if ( lentrim_arg2 .lt. 0 ) then
      print *, "ERROR: input argument. Usage: ./a.out  SomePath  rwxr-xr-x"
      stop
   endif 

   print *, 'arg1 =' // arg1(1:lentrim_arg1) // '<--Target name'
   print *, 'arg2 =' // arg2(1:lentrim_arg2) // '<--Permission fully'

   call funx_chmod_perm ( & 
        arg1(1:lentrim_arg1), arg2(1:lentrim_arg2), errno )

   call funx_perror ( 't_chmod_03', errno )

   end program 
