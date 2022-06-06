!
!  ./a.out  644
!
!
      program  t_modedec 
!
      use my_funx 
!
      implicit none
!
!     include  'i_param.inc'
!
      character(len=90) :: arg1
      character(len=90) :: perm
      integer(ck_mode_t)  ioct, idec  
      integer(ck_int)     errno
      integer(ck_size_t)  len_arg1, lentrim_arg1
!     external    funx_getarg, funx_dec2per, funx_dec2oct
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. ./a.out  511"
         stop
      else 
         read( arg1, * ) idec 
         print *, 'idec =', idec 
      endif 

      call funx_dec2per ( idec, perm )
      call funx_dec2oct ( idec, ioct )

      write(*,1) idec, ioct, trim(perm) 

1     format( &
      "decimal form:",i7, ", octal form: ",i7,", permission: ", a )

      end program 
