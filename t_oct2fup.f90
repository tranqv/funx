!
!  ./a.out  511
!  ./a.out  8630
!
!
      program  t_oct2fup 

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
!     external    funx_getarg, funx_oct2fup, funx_oct2dec
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. Examples: ./a.out  N"
         print *, "for N= 777 20666 40755 20550 41777 "
         stop
      else 
         read( arg1, * ) ioct 
         print *, 'ioct =', ioct 
      endif 

      call funx_oct2fup ( ioct, perm )
      call funx_oct2dec ( ioct, idec )

      write(*,1) ioct, idec, trim(perm) 

1     format( &
      "Octal form: ",i7," Decimal form: ",i7, " Full unix perm: ", a )

      end program 
