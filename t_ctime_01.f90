!
!  Test:
!
!  ./t_ctime_01.exe   1583171848
!
!  -->   Mon Mar  2 18:01:04 2020
!
!
   program t_ctime_01 
!
   use mod_funx_param 
   use mod_funx_faces
!
   implicit none

!  include     'i_param.inc'
   integer(ck_time_t)   :: ntim 

   character(len=99) :: ctim
   character(len=90) :: timc
   integer(kind=ck_size_t) :: len_ctim, lentrim_ctim, len_timc, lentrim_timc
   integer(kind=ck_int)    :: errno 
!
!
   len_ctim = len(ctim)

   lentrim_ctim = -1 
   call funx_getarg ( 1, ctim, lentrim_ctim, errno )

   if ( lentrim_ctim .lt. 0 ) then
      print *, "ERROR: input. Ex: ./a.out 1582085218"
      stop
   else 
      read( ctim(1:lentrim_ctim), * ) ntim 
      print *, "arg = ", ntim, ', lentrim =', lentrim_ctim
   endif 

   len_timc = len(timc)

   call funx_ctime ( ntim, timc, len_timc, lentrim_timc, errno )

   print *, 'Input  ='//ctim(1:lentrim_ctim)//'<-- lentrim =', lentrim_ctim 
   print *, 'Output ='//timc(1:lentrim_timc)//'<-- lentrim =', lentrim_timc
   print *, 'OK ?'


   call funx_perror ( 't_ctime_01', errno )


   end program 
