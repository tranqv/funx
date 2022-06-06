      program t_link_01 
!
      use my_funx 
      implicit none
!
!     include     'i_errno.inc'
!     include     'i_param.inc'
!
      character(len=999)   f1, f2, f0  
      integer(ck_int)      errno
      integer(ck_size_t)   &
         maxl1, maxl2, maxl0, lentrim_f1, lentrim_f2, lenf0
   
      maxl0 = len(f0)
      maxl1 = len(f1)
      maxl2 = len(f2)

      call funx_getcwd ( f0, maxl0, lenf0, errno )

      call funx_perror (   &
         '--> funx_getcwd ( fname, maxlen, lenfname, errno )', errno )

      print *, 'PWD  ='//f0(1:lenf0)

      lentrim_f1 = -1 
      call funx_getarg ( 1, f1, lentrim_f1, errno)

      lentrim_f2 = -1 
      call funx_getarg ( 2, f2, lentrim_f2, errno)

      if ( lentrim_f2 .lt. 1 ) then
         write(*,*) 'ERROR: Reading two arguments. Stop.'
         write(*,*) 'usage: ./$0   /path/of/f1   f2'
         stop
      else 
         write(*,'(a,1x,a)') 'src = arg(1) = ', f1(1:lentrim_f1)
         write(*,'(a,1x,a)') 'des = arg(2) = ', f2(1:lentrim_f2)
      endif 

      call funx_link ( f1(1:lentrim_f1), f2(1:lentrim_f2), errno )

      call funx_perror (  &
         "funx_link("//trim(f1)//", "//trim(f2)//", errno)", errno )

      end program
