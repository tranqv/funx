!
!  for f in *.c ; do echo "gcc -c $f" ; gcc -c $f  ; done
!  for f in *.f90 ; do echo "gfortran -c $f" ; gfortran -c $f  ; done
!  gfortran t_getcwd_01.o c_*.o f_*.o
!  ./a.out 
!
!
   program t_getcwd_01 

   use my_funx 

   implicit none

   character(len=4096) :: path
   integer(4) ::  errno 
   integer(8) ::  lenpath, lentrim
!  external    funx_getcwd, funx_perror  

   lenpath = len(path)

   call funx_getcwd ( path, lenpath, lentrim, errno )

!  print *, 'OK'

!  call check_errno ( errno, &
!  '--> funx_getcwd ( path, lenpath, lentrim, errno )' )

   print 1, 'PWD    = ', path(1:lentrim)
!  print *, 'PWD    = ' // trim(path) // '<-'
!  print *, 'lenpath= ', lenpath
!  print *, 'lentrim= ', lentrim
   print 2, 'Length = ', lentrim
!  print *, 'errno  = ', errno  

   call funx_perror ( 't_getcwd_01', errno )

1  format( a, a )
2  format( a, i7 )
   stop 
   end program 
