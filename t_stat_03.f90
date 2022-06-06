!
!  ./a.out  path/to/file
!
   program  t_stat_03 
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
!  external    funx_is_dir,   funx_is_exist, funx_is_link,  &
!              funx_is_socket, funx_is_fifo, funx_is_reg,   &
!              funx_is_chrdev, funx_is_blkdev,              &
!              funx_is_r_ok, funx_is_w_ok, funx_is_x_ok
!
!  logical     funx_is_dir,   funx_is_exist, funx_is_link,  &
!              funx_is_socket, funx_is_fifo, funx_is_reg,   &
!              funx_is_chrdev, funx_is_blkdev,              &
!              funx_is_r_ok, funx_is_w_ok, funx_is_x_ok
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

      call funx_perror ( 't_stat_03', errno )
!
!
      write(*,'(36("-"),/,a)') &
         'Probing '//arg1(1:lentrim_arg1)//' in terms of specific aspect:'
!
      write(*,10) 'is dir    ?', funx_is_dir (arg1(1:lentrim_arg1))
      write(*,10) 'is exist  ?', funx_is_exist (arg1(1:lentrim_arg1))
      write(*,10) 'is link   ?', funx_is_link (arg1(1:lentrim_arg1))
      write(*,10) 'is socket ?', funx_is_socket (arg1(1:lentrim_arg1))
      write(*,10) 'is fifo   ?', funx_is_fifo (arg1(1:lentrim_arg1))
      write(*,10) 'is reg    ?', funx_is_reg (arg1(1:lentrim_arg1))
      write(*,10) 'is chrdev ?', funx_is_chrdev (arg1(1:lentrim_arg1))
      write(*,10) 'is blkdev ?', funx_is_blkdev (arg1(1:lentrim_arg1))
!
      write(*,'(/,a)') &
         'NOTE: the following results are based on current UID and GID.'

      write(*,10) 'is read   ?', funx_is_r_ok (arg1(1:lentrim_arg1))
      write(*,10) 'is write  ?', funx_is_w_ok (arg1(1:lentrim_arg1))
      write(*,10) 'is execute?', funx_is_x_ok (arg1(1:lentrim_arg1))
!
      i = i + 1 
   enddo 

10 format ( a30,1x, L ) 
   end program 
!
!
!
