!
!
!
   program t_abspath_01 

!  use mod_funx_param 
!  use mod_funx_faces
   use my_funx 
   implicit none
!  
!
   character(len=4096) :: path
   character(len=4096) :: fnam
   integer(kind=ck_size_t)  &
      len_path, lentrim_path, len_fnam, lentrim_fnam  
   integer(kind=ck_int)    errno 
!  external    funx_getenv, funx_getarg, funx_perror, funx_abspath   
!
!
   len_fnam = len(fnam)

   lentrim_fnam = -1 
   call funx_getarg ( 1, fnam, lentrim_fnam, errno )

   if ( lentrim_fnam .lt. 0 ) then
      print *, "ERROR: Wrong input. Usage: ./a.out  somefile"
      stop 
   endif 

   len_path = len(path)

   call funx_abspath ( &
        fnam(1:lentrim_fnam), path, len_path, lentrim_path, errno )

   if ( errno .eq. 0 ) then 
      print 1, 'Target name   = ' // fnam(1:lentrim_fnam) 
      print 1, 'Its real path = ' // path(1:lentrim_path) 
      print 2, 'Its length    = ',  lentrim_path
   else 
      print 1, 'Target name   = ' // fnam(1:lentrim_fnam) 
      print 1, 'Unknown its real path'  
      call funx_perror ( 't_abspath_01', errno )
   endif 


1  format( a )
2  format( a, i9 )
   end program 
