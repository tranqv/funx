!
!  ./a.out  644
!
!
      program  t_scalebyte 

      use my_funx 
      implicit none
!
!     include  'i_param.inc'
!
      character(len=90) :: arg1
      character(len=10) :: unitstr
      integer(ck_off_t)    isize
!     real(ck_double)      rsize
      real(ck_float)       rsize

      integer(ck_int)      errno
      integer(ck_size_t)   len_arg1, lentrim_arg1
!     external    funx_getarg, funx_scalebyte !, c_utils_scalebyte
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. ./a.out  511"
         stop
      else 
         read( arg1, * ) isize
         print *, 'isize = ', isize, ' (bytes)'
      endif 

!     call c_utils_scalebyte ( isize, rsize, unitstr )
      call funx_scalebyte ( isize, rsize, unitstr )

      print *, 'rsize = ', rsize, trim(unitstr) 

      end program 
