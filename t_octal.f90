!
!
      program octal01

      implicit none 

      integer           n, m, k
      character(len=7)  ch

      n = O'0777'
      write(*,'("n = ", i4, o4 )') n, n 

      ch = '0777'
      read( ch, '(O4)' ) m 
      write(*,'("m = ", i4, o4 )') m, m 

      ch = '777'
      read( ch, '(O3)' ) k 
      write(*,'("k = ", i4, o4 )') k, k 

      n = 511 
      write( ch,'(O4)' ) n
      write(*,'("ch = ", a)') ch 


      end program 
