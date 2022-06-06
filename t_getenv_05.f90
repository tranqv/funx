!
!  detect the length of dimensioned character string until its room 
!  is larger enough to store ENV variable
!
!
   program t_getenv_05 

   use my_funx 
   implicit none
!
!  include     'i_errno.inc'
!  include     'i_param.inc'
!
   character(len=:),allocatable :: envv 
   character(len=99) :: envn
   integer(kind=ck_size_t)  lentrim_envn, len_envv, i
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

   call funx_getenv ( &
        envn(1:lentrim_envn), envv, len_envv, errno )

   print *, 'env     =', envn(1:lentrim_envn)
   print *, 'val     ='//envv 
   print *, 'len val =', len_envv

   if ( len_envv .eq. 0 ) then 
      write(*,*) 'Not exist environmental variable. errno =', errno 
      stop 
   endif 

   print *, 'OK?', envv(1:1), envv(len_envv:len_envv)

   print *, 'OK!'

   write(*,fmt='(a)',advance="no") 'val =' 

   do i = 1,len_envv
      write(*,fmt='(a1)',advance="no") envv(i:i) 
   enddo


   end program 
