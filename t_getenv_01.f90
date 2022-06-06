!
!
!
   program t_getenv_01 

   use my_funx 

   implicit none
!
!  include     'i_param.inc'
!
   character(len=4096) :: envn
   character(len=4096) :: envv
   integer(kind=ck_size_t)  len_n, lentrim_n, len_v, lentrim_v
   integer(kind=ck_int)     errno 
!  external    funx_getenv, funx_getarg, funx_perror  
!
!
   len_n = len(envn)

   lentrim_n = -1 
   call funx_getarg ( 1, envn, lentrim_n, errno )

   if ( lentrim_n .lt. 0 ) then
      print *, "ERROR: Wrong input. Usage: ./a.out HOME "
      stop 
   endif 

   len_v = len(envv)

   call funx_getenv ( envn(1:lentrim_n), envv, len_v, lentrim_v, errno )

   if ( errno .eq. 0 ) then 

      print 1, 'ENV Var    = ' // envn(1:lentrim_n) 
      print 1, '    Value  = ' // envv(1:lentrim_v) 
      print 2, '    Length = ',  lentrim_v  
   else 
      print 1, 'ENV Var    = ' // envn(1:lentrim_n) 
      print 1, '    Value  = ' // '???'
      call funx_perror ( 't_getenv_01', errno )
   endif 



1  format( a )
2  format( a, i9 )
   end program 
