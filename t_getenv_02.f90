!
!  detect the length of dynamic character string until its room 
!  is larger enough to store ENV variable
!
!
   program t_getenv_02 

   use my_funx 
   implicit none
!
!  include     'i_errno.inc'
!  include     'i_param.inc'
!
   character (len=:), allocatable :: envv 
   character(len=99) :: envn
   integer(kind=ck_size_t)  lentrim_envn, len_envv, lentrim_envv
   integer(kind=ck_int)     errno 
!
!  external    funx_getenv, funx_getarg, funx_perror  
!
!
   lentrim_envn = -1 
   call funx_getarg ( 1, envn, lentrim_envn, errno )

   if ( lentrim_envn .lt. 0 ) then
      print *, "ERROR: input the name of env variable. /a.out HOME"
      stop 
   else 
      print *, "arg ="//envn(1:lentrim_envn)
   endif 

!
   len_envv = 1 
!
!
!  You may want to increase the step-size to reduce the number of loop
!
99 len_envv = len_envv + 1 

   allocate( character(len=len_envv) :: envv )

   print *

   len_envv = len(envv)
   call funx_getenv ( &
        envn(1:lentrim_envn), envv, len_envv, lentrim_envv, errno )

   print *, 'env     =' // envn(1:lentrim_envn) // '<-'
   print *, 'val     =' // envv(1:lentrim_envv) // '<-'
   print *, 'len val =', len_envv
   print *, 'lentrim =', lentrim_envv

   print *, 'OK?'
   print *, 'errno   =', errno  
   call funx_perror ( 't_getenv_02', errno )

   if ( errno .eq. ck_erange ) then
      deallocate ( envv ) 
      goto 99
   else  
      print *, 'OK!'
   endif 

   end program 
