!
!  detect the length of dynamic character string until its room 
!  is larger enough to store PWD
!
!
   program t_getcwd_02 

   use my_funx 

   implicit none

   character (len=:), allocatable :: path 
   integer(4) :: errno
   integer(8) :: lenpath, lentrim
!
!  include     'i_errno.inc'
!  external    funx_getcwd, funx_perror  
!
!
   lenpath = 10 

99 lenpath = lenpath + 1 

   allocate( character(len=lenpath) :: path )

   print *

   call funx_getcwd ( path, lenpath, lentrim, errno )

!  call check_errno ( errno, &
!  '--> funx_getcwd ( path, lenpath, lentrim, errno )' )

   print *, 'PWD    =' // path(1:lentrim) // '<-'
   print *, 'PWD    =' // trim(path) // '<-'
   print *, 'lenpath=', lenpath
   print *, 'lentrim=', lentrim

   print *, 'OK?'
   print *, 'errno  =', errno  
   call funx_perror ( 't_getcwd_02', errno )

   if ( errno .eq. ck_erange ) then
      deallocate ( path ) 
      goto 99
   else  
      print *, 'OK!'
   endif 

   end program 
