      

      program t_mode_t_01 

      implicit none 

      integer,parameter :: mode_t = 4 

      integer(mode_t)  n1

      n1 = ishft(1,8)

      write(*,*) n1 


      end program 
