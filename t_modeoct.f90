!
!  ./a.out  644
!
!
      program  t_modeoct 

      use my_funx 
      implicit none
!
!     include  'i_param.inc'
!     external    funx_getarg, funx_oct2per, funx_oct2dec
!
      character(len=90) :: arg1
      character(len=90) :: perm
      integer(ck_mode_t)  ioct, idec  
      integer(ck_int)     errno
      integer(ck_size_t)  len_arg1, lentrim_arg1
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. ./a.out  777"
         stop
      else 
         read( arg1, * ) ioct 
         print *, 'ioct =', ioct 
      endif 

      call funx_oct2per ( ioct, perm )
      call funx_oct2dec ( ioct, idec )

      write(*,1) ioct, idec, trim(perm) 

1     format( &
      "octal form:",i7, ", decimal form: ",i7,", permission: ", a )

      end program 
