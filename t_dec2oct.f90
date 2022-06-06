!
!  ./a.out  644
!
!
      program  t_dec2oct 

      use mod_funx_param 
      use mod_funx_faces

      implicit none

!     include  'i_param.inc'

      character(len=90) :: arg1
      integer(ck_mode_t)  idec, ioct 
      integer(ck_int)     errno
      integer(ck_size_t)  len_arg1, lentrim_arg1
      external    f_utils_dec2oct
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. ./a.out  511"
         stop
      else 
         print *, 'idec =' // arg1(1:lentrim_arg1) 
      endif 

      read( arg1, * ) idec 

      call f_utils_dec2oct ( idec, ioct )

      print *, 'ioct =', ioct

      end program 
