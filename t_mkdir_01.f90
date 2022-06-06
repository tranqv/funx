!
!
!
   program  t_mkdir_01 

   use my_funx 
   implicit none
!
!  include  'i_param.inc'
!
   character(len=90) :: argi
   integer(ck_int)      errno
   integer(ck_mode_t)   imode
   integer(ck_size_t)   len_argi, lentrim_argi
!  external    funx_getarg, funx_perror, funx_mkdir 
!
!
   len_argi = len(argi)

   lentrim_argi = -1 
   call funx_getarg ( 1, argi, lentrim_argi, errno )

   if ( lentrim_argi .lt. 0 ) then
      print *, "ERROR: input argument. ./a.out  ./tmp1"
      stop
   else 
      print *, 'argi =' // argi(1:lentrim_argi) // '<-'
   endif 

!  imode = ck_s_iwusr + ck_s_irusr + ck_s_ixusr
!  imode = ck_s_irwxu + ck_s_irwxo + ck_s_irwxg

!
!  0777:
!  imode = ck_s_iwusr + ck_s_irusr + ck_s_ixusr + & 
!          ck_s_iwgrp + ck_s_irgrp + ck_s_ixgrp + & 
!          ck_s_iwoth + ck_s_iroth + ck_s_ixoth 
!
!  --> decimal value! We need octal value.
!

   imode = ior(ior(ior(ior(ior(ior(ior(ior(      &
            ck_s_iwusr ,ck_s_irusr),ck_s_ixusr), & 
            ck_s_iwgrp),ck_s_irgrp),ck_s_ixgrp), & 
            ck_s_iwoth),ck_s_iroth),ck_s_ixoth)

   WRITE(*,'(a,i5,o5)') 'imode 1 = ', imode, imode 

   imode = ior(ior(ck_s_irwxu,ck_s_irwxo),ck_s_irwxg)

   WRITE(*,'(a,i5,o5)') 'imode 2 = ', imode, imode 

   imode = 0777
   WRITE(*,'(a,i5,o5)') 'imode 3 = ', imode, imode 

   imode = ck_s_iwusr + ck_s_irusr + ck_s_ixusr + & 
           ck_s_iwgrp + ck_s_irgrp + ck_s_ixgrp + & 
           ck_s_iwoth + ck_s_iroth + ck_s_ixoth 

   WRITE(*,'(a,i5,o5)') 'imode 4 = ', imode, imode 

!  write( rout,'(o4)') imode 
!  read ( rout,'(i4)') imode 
!  write(*,'(a,i5)') 'Convert imode from Dec to Oct = ', imode

   call funx_mkdir_decf ( argi(1:lentrim_argi), imode, errno )

   call funx_perror ( 't_mkdir_01', errno )

   end program 
