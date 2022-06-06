!
!
!
   program t_relpath_03 

   use my_funx 
   implicit none
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
      print *, "ERROR: Wrong input. Usage: ./a.out  somepath "
      stop 
   endif 

   call funx_relpath ( &
        fnam(1:lentrim_fnam), path, size_path, errno )

   if ( errno .eq. 0 ) then 
      print *, 'Target name   = ', fnam(1:lentrim_fnam) 
      print *, 'Its Rel. path = ' // path
      print *, 'with size     = ', size_path
      print *, 'check size    = ', len(path)

   else 
      print *, 'Target name   = ' // fnam(1:lentrim_fnam) 
      print *, 'Unknown its Rel. path'  
      call funx_perror ( 't_relpath_03', errno )
   endif 

   end program 
