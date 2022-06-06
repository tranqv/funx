!
!  ./a.out  644
!
!
      program  t_modeper 

      use my_funx 
      implicit none
!
!     include  'i_param.inc'
!
      character(len=90) :: arg1
      character(len=90) :: perm
      integer(ck_mode_t)  ioct, idec  
      integer(ck_int)     errno
      integer(ck_size_t)  &
         len_arg1, lentrim_arg1
!     external    funx_getarg, funx_per2dec, funx_per2oct
!
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         print *, "ERROR: input argument. ./a.out  rwxrwxrwx"
         stop
      else 
         perm = arg1(1:lentrim_arg1) 
         print *, 'perm =' // trim(perm) 
      endif 

      call funx_per2dec ( trim(perm), idec )
      call funx_per2oct ( trim(perm), ioct )

      write(*,1) trim(perm), idec, ioct 

1     format( &
      "permission: ",a,", decimal form: ",i7,", octal form: ",i7 )

      end program 
