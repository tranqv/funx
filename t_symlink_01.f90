      program t_symlink_01 

      use my_funx 
      implicit none
!
!     include     'i_errno.inc'
!     include     'i_param.inc'
!
      character(len=ck_path_max) f1, f2, f0  
      integer(ck_int)      errno
      integer(ck_size_t)   &
         len_f1, len_f2, len_f0, lentrim_f1, lentrim_f2, lentrim_f0
!     external    funx_perror, funx_getcwd, funx_getarg, funx_symlink

   
      len_f0 = len(f0)
      len_f1 = len(f1)
      len_f2 = len(f2)

      call funx_getcwd ( f0, len_f0, lentrim_f0, errno )
      call funx_perror ( 'funx_getcwd', errno )

      print '(a,1x,a)', 'pwd = ', f0(1:lentrim_f0)

      lentrim_f1 = -1 
      call funx_getarg ( 1, f1, lentrim_f1, errno)

      lentrim_f2 = -1 
      call funx_getarg ( 2, f2, lentrim_f2, errno)

      if ( lentrim_f2 .lt. 1 ) then
         write(*,*) 'ERROR: Reading two arguments. Stop.'
         write(*,*) 'usage: ./$0   /path/of/f1   f2'
         stop
      else 
         write(*,'(a,1x,a)') 'SRC = ', f1(1:lentrim_f1)
         write(*,'(a,1x,a)') 'DES = ', f2(1:lentrim_f2)
      endif 

      call funx_symlink ( f1(1:lentrim_f1), f2(1:lentrim_f2), errno )

      call funx_perror ( 't_symlink_01: SRC <-- DES ', errno )

      end program
