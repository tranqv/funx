!
!
!
      program t_chdir_01 
!
      use mod_funx_param 
      use mod_funx_faces
      implicit none 

      integer(8)  lenpath, lentrim
      integer(4)  errno 
!     external    funx_getcwd, funx_perror, funx_chdir  
!
      character(len=1024) :: path
!
!
      call funx_chdir ( "..", errno )
      print *, errno


      lenpath = len(path)

      call funx_getcwd ( path, lenpath, lentrim, errno )
      print *, 'PWD    =' // path(1:lentrim) // '<-'

      call funx_chdir ( "/tmp/", errno )
      print *, errno

      call funx_getcwd ( path, lenpath, lentrim, errno )
      print *, 'PWD    =' // path(1:lentrim) // '<-'


      end program 
