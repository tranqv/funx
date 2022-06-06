!
!  ./a.out  tmp1 777
!  ./a.out  tmp1 644
!
!
   program  t_mkpath_01 
!
   use my_funx
! 
   implicit none
!
!  include  'i_param.inc'
!
   character(len=90) :: arg1, arg2
   integer(ck_int)      imode 
   integer(ck_mode_t)   errno
   integer(ck_size_t)   & 
               len_arg1, lentrim_arg1, &
               len_arg2, lentrim_arg2   
!  external    funx_getarg, funx_perror, funx_mkpath 
!
!
   len_arg1 = len(arg1)
   len_arg2 = len(arg2)

   lentrim_arg1 = -1 
   call funx_getarg ( 1, arg1, lentrim_arg1, errno )

   lentrim_arg2 = -1 
   call funx_getarg ( 2, arg2, lentrim_arg2, errno )



   if ( lentrim_arg2 .lt. 0 ) then
      print *, "ERROR: input argument. ./a.out  ./tmp1/tmp2  511"
      stop
   else 
      read( arg2, * ) imode 
   endif 

   print *, 'arg1 =' // arg1(1:lentrim_arg1) // '<- Directory name'
   print *, 'arg2 =' // arg2(1:lentrim_arg2) // '<- Mode of perm as DECIMAL form'

   call funx_mkpath_decf ( arg1(1:lentrim_arg1), imode, errno )

   call funx_perror ( 't_mkpath_01', errno )

   end program 
