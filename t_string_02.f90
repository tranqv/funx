

      program t_string_02 

      implicit none 

      integer,parameter    :: ls = 20
      character            :: s(ls), c 
      character(len=*),parameter  :: str = 't q viet'
      integer     i, lstr  


      s(1:ls) = '' 

      write(*,*) '>>', s(1:ls), '<<'

      lstr = len(str)

      do i = 1,len(str)
         s(i) = str(i:i)
      enddo 

      write(*,*) '>>', s(1:lstr), '<<'
      write(*,*) '>>', s(1:lstr), achar(8), '<<'
      write(*,*) '>>', s(1:lstr), achar(8), 'c', '<<'

      c = ''
      write(*,*) ichar(c) 
      write(*,'(">",a1,"<")') achar(ichar(c))

      end program 
