!
!  Allocatable array of characters 
! 
!
   program t_abspath_02 

   use my_funx 
   implicit none
!
!
   character,dimension(:),allocatable :: path
   character(len=4096) :: fnam
   integer(kind=ck_size_t)  &
      size_path, len_fnam, lentrim_fnam  
   integer(kind=ck_int)    errno 
!
!
   len_fnam = len(fnam)

   lentrim_fnam = -1 
   call funx_getarg ( 1, fnam, lentrim_fnam, errno )

   if ( lentrim_fnam .lt. 0 ) then
      print *, "ERROR: Wrong input. Usage: ./a.out  somefile"
      stop 
   endif 

   call funx_abspath ( &
        fnam(1:lentrim_fnam), path, size_path, errno )

   if ( errno .eq. 0 ) then 
      print *, 'Target name   = ' // fnam(1:lentrim_fnam) 
      print *, 'Its real path = ', path
      print *, 'Its size      = ', size_path
      print *, 'check the size= ', size(path)
   else 
      print *, 'Target name   = ' // fnam(1:lentrim_fnam) 
      print *, 'Unknown its real path'  
      call funx_perror ( 't_abspath_02', errno )
   endif 


   end program t_abspath_02
