!
!  ./a.out  path/to/files
!  ./t_access_01.exe /usr/local/bin/*
!  ./t_access_01.exe /concac
!
   program  t_access_01 
!
   use mod_funx_param 
   use mod_funx_faces
   implicit none
!
   character(len=ck_name_max) :: arg1
   integer              i 
   integer(ck_int)      errno
   integer(ck_size_t)   len_arg1, lentrim_arg1
!
!  external    funx_getarg, funx_perror, funx_access_f, &
!              funx_access_r, funx_access_w, funx_access_x
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

      call funx_access_f ( arg1(1:lentrim_arg1), errno )
      call funx_perror ( arg1(1:lentrim_arg1)//': existence.', errno )

      call funx_access_r ( arg1(1:lentrim_arg1), errno )
      call funx_perror ( arg1(1:lentrim_arg1)//': read.     ', errno )

      call funx_access_w ( arg1(1:lentrim_arg1), errno )
      call funx_perror ( arg1(1:lentrim_arg1)//': write.    ', errno )

      call funx_access_x ( arg1(1:lentrim_arg1), errno )
      call funx_perror ( arg1(1:lentrim_arg1)//': execute.  ', errno )

      i = i + 1 
   enddo 

   end program 
!
!
!
