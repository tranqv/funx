!
!  detect the length of dynamic character string until its room 
!  is larger enough to store PWD
!
!
   program t_getcwd_04 

   use my_funx 

   implicit none

   character(len=:),allocatable :: path 
   integer(4) :: errno
   integer(8) :: lenpath
!
!
   call funx_getcwd ( path, lenpath, errno )

   print *, 'PWD     =' // path
   print *, 'lenpath =', lenpath

   print *, 'OK ? errno =', errno  
   call funx_perror ( 't_getcwd_04', errno )

   end program 
