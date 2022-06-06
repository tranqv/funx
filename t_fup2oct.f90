!
!  ./a.out  511
!  ./a.out  8630
!
!
      program  t_fup2oct 

      use my_funx 
      implicit none
!
!     include  'i_param.inc'
!
      character(len=90) :: arg1
      character(len=90) :: perm
      integer(ck_mode_t)  idec, ioct  
      integer(ck_int)     errno
      integer(ck_size_t)  len_arg1, lentrim_arg1
!     external    funx_getarg, funx_fup2oct, funx_oct2dec
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. Examples:"
         print *, "   ./a.out  ?rwxrwxrwx.---    Out: 777    511  "
         print *, "   ./a.out  lrwxrwxrwx.---    Out: 120777 41471"
         print *, "   ./a.out  -rw-r--r--.---    Out: 100644 33188"
         print *, "   ./a.out  drwxrwxrwx.--S    Out: 41777  17407"
         print *, "   ./a.out  drwxrwxrwx.UGS    Out: 47777  20479"
         print *, "   ./a.out  srwxrwxrwx.UGS    Out: 147777 53247"
         stop
      else 
         perm = arg1(1:lentrim_arg1)
         print *, 'perm =', trim(perm)
      endif 

      call funx_fup2oct ( perm, ioct )
      call funx_oct2dec ( ioct, idec )

      write(*,1) trim(perm), ioct, idec
1     format( &
      "Full unix perm: ", a, " Octal form: ",i7,"  Decimal form:",i7 )

      end program 
