!
!  Use allocatable array of characters 
!
   program t_readlink_03 

   use my_funx 
   implicit none
!
!
   character(len=:),allocatable :: path
   character(len=ck_path_max) :: fnam
   integer(kind=ck_size_t)  &
      size_path, len_fnam, lentrim_fnam  
   integer(kind=ck_int)    errno 
!
!
   len_fnam = len(fnam)

   lentrim_fnam = -1 
   call funx_getarg ( 1, fnam, lentrim_fnam, errno )

   if ( lentrim_fnam .lt. 0 ) then
      print *, "ERROR: Wrong input. Usage: ./a.out  somelink"
      stop 
   endif 

   call funx_readlink ( &
        fnam(1:lentrim_fnam), path, size_path, errno )

   if ( errno .eq. 0 ) then 
      print *, 'Target link  = ', fnam(1:lentrim_fnam) 
      print *, '  Its path   = '// path
      print *, '  and size   = ', size_path
   else 
      print *, 'Target link  = ' // fnam(1:lentrim_fnam) 
      print *, 'ERROR: unknown its path. Check your input.'  
      call funx_perror ( 't_readlink_03', errno )
   endif 

   end program 
