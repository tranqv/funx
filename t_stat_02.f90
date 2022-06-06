!
!  ./a.out  path/to/file
!
   program  t_stat_02 
!
   use my_funx 
   implicit none
!
!  include  'i_param.inc'
!
   character(len=ck_name_max) :: arg1
   integer              i 
   integer(ck_int)      errno
   integer(ck_size_t)   len_arg1, lentrim_arg1
   type(ck_stat)        fstat
!
!  external    funx_getarg, funx_perror, funx_stat, funx_stat_print 
!
!
   len_arg1 = len(arg1)

   i = 0 

   do 
      lentrim_arg1 = -1 
      call funx_getarg ( i, arg1, lentrim_arg1, errno )

      if ( lentrim_arg1 .lt. 0 ) then
         write(*,'(/,a)') &
            "Exit. Due to len(arg) < 0"
         stop
      else 
         write(*,'(72("*"),/,i9,3x,a)') &
            i, 'arg =' // arg1(1:lentrim_arg1) // '<- File name'
      endif 

      call funx_stat ( arg1(1:lentrim_arg1), fstat, errno )

      call funx_stat_print ( fstat )  

      call funx_perror ( 't_stat_02', errno )

      i = i + 1 
   enddo 

   end program 
!
!
!
