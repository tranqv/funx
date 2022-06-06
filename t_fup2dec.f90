!
!  ./a.out  511
!  ./a.out  8630
!
!
      program  t_fup2dec 

      use my_funx 
      implicit none
!
!     include  'i_param.inc'
!
      character(len=90) :: arg1
      character(len=90) :: perm
      integer(ck_mode_t)  ioct, idec  
      integer(ck_int)     errno
      integer(ck_size_t)  len_arg1, lentrim_arg1
!     external    funx_getarg, funx_fup2dec, funx_dec2oct
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. Examples:"
         print *, "   ./a.out  ?rwxrwxrwx.---    Out: 511 & 777 "
         print *, "   ./a.out  lrwxrwxrwx.---    Out: 41471 & 120777"
         print *, "   ./a.out  -rw-r--r--.---    Out: 33188 & 100644"
         print *, "   ./a.out  drwxrwxrwx.--S    Out: 17407 & 41777 "
         print *, "   ./a.out  drwxrwxrwx.UGS    Out: 20479 & 47777 "
         print *, "   ./a.out  srwxrwxrwx.UGS    Out: 53247 & 147777"
         stop
      else 
         perm = arg1(1:lentrim_arg1)
         print *, 'perm =', trim(perm)
      endif 

      call funx_fup2dec ( perm, idec )
      call funx_dec2oct ( idec, ioct )

      write(*,1) trim(perm), idec, ioct
1     format( &
      "Full unix perm: ", a,", Decimal form:",i7, ", Octal form: ",i7 )

      end program 
