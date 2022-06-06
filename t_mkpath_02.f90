!
!  ./a.out  tmp1 777
!  ./a.out  tmp1 644
!
   program  t_mkpath_02 
!
   use my_funx 
!
   implicit none
!
!  include  'i_param.inc'
!
   character(len=90) :: arg1, arg2
   integer(ck_int)      errno
   integer(ck_mode_t)   imode
   integer(ck_size_t)   & 
      len_arg1, lentrim_arg1, &
      len_arg2, lentrim_arg2   
!  external    funx_getarg, funx_perror, funx_mkpath_perm  
!
!
   len_arg1 = len(arg1)
   len_arg2 = len(arg2)

   lentrim_arg1 = -1 
   call funx_getarg ( 1, arg1, lentrim_arg1, errno )

   lentrim_arg2 = -1 
   call funx_getarg ( 2, arg2, lentrim_arg2, errno )



   if ( lentrim_arg2 .lt. 0 ) then
      print *, "ERROR: input argument. ./a.out  ./tmp1  777"
      stop
   else 
      read( arg2, * ) imode 
   endif 

   print *, 'arg1 =' // arg1(1:lentrim_arg1) // '<- Directory name'
   print *, 'arg2 =', imode, '<- Mode of perm as OCTAL form'


   call funx_mkpath_octf ( & 
        arg1(1:lentrim_arg1), imode, errno )

   call funx_perror ( 't_mkpath_02', errno )

   end program 
