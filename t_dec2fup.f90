!
!  ./a.out  511
!  ./a.out  8630
!
!
      program  t_dec2fup 

      use mod_funx_param 
      use mod_funx_faces

      implicit none

      character(len=90) :: arg1
      character(len=90) :: perm
      integer(ck_mode_t)  ioct, idec  
      integer(ck_int)     errno
      integer(ck_size_t)  len_arg1, lentrim_arg1
      external    f_utils_dec2fup, f_utils_dec2oct
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. Examples: ./a.out  N"
         print *, "for N= 511 8630 16877 8624 17407 "
         stop
      else 
         read( arg1, * ) idec 
         print *, 'idec =', idec 
      endif 

      call f_utils_dec2fup ( idec, perm )
      call f_utils_dec2oct ( idec, ioct )

      write(*,1) idec, ioct, trim(perm) 

1     format( &
      "Decimal form:",i7, ", Octal form: ",i7,", Full unix perm: ", a )

      end program 
