!
!
!
   program t_readlink_01 

   use my_funx 
   implicit none
!
!  include     'i_param.inc'
!
   character(len=ck_path_max) :: path
   character(len=ck_path_max) :: fnam
   integer(kind=ck_size_t)  &
      len_path, lentrim_path, len_fnam, lentrim_fnam  
   integer(kind=ck_int)    errno 
!  external    funx_getenv, funx_getarg, funx_perror, funx_readlink   
!
!
   len_fnam = len(fnam)

   lentrim_fnam = -1 
   call funx_getarg ( 1, fnam, lentrim_fnam, errno )

   if ( lentrim_fnam .lt. 0 ) then
      print *, "ERROR: Wrong input. Usage: ./a.out  somelink"
      stop 
   endif 

   len_path = len(path)

   call funx_readlink ( &
        fnam(1:lentrim_fnam), path, len_path, lentrim_path, errno )

   if ( errno .eq. 0 ) then 
      print 1, 'Target link  = ' // fnam(1:lentrim_fnam) 
      print 1, '  Its path   = ' // path(1:lentrim_path) 
      print 2, '  and length = ',  lentrim_path
   else 
      print 1, 'Target link  = ' // fnam(1:lentrim_fnam) 
      print 1, 'ERROR: unknown its path. Check your input.'  
      call funx_perror ( 't_readlink_01', errno )
   endif 


1  format( a )
2  format( a, i9 )
   end program 
