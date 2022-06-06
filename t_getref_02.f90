!
!
!
      program t_vgetaddr_02 
!
      use mod_funx_param 
!
      implicit none
!
      intrinsic   loc 
!
      integer(ck_int)         i4, i4v 
      integer(ck_long)        i8, i8v
      real(ck_float)          r4, r4v 
      real(ck_double)         r8, r8v
      integer(ck_intptr_t)    ip, i4ref, i8ref, r4ref, r8ref  

!
      i4v = -1 
      i4 = 123  
!
      ip = loc ( i4 ) 

      call f_utils_vgetaddr_int    ( i4, i4ref )
      write(*,*) 'var i4 =', i4, '. var i4v =', i4v, &
         ck_char_lf//ck_char_tab//', ref1 =', i4ref, ', ref2 =', ip 
  

      call c_utils_vgetinfo_int ( i4ref, i4v )

      ip = loc ( i4v ) 

      write(*,*) 'var i4v =', i4v, ', ref2 =', ip    
      write(*,'(72("-"))')
!
!
      i8v = -1 
      i8 = 987654321
!
      ip = loc ( i8 ) 

      call f_utils_vgetaddr_int    ( i8, i8ref )
      write(*,*) 'var i8 =', i8, '. var i8v =', i8v, &
         ck_char_lf//ck_char_tab//', ref1 =', i8ref, ', ref2 =', ip 
 
      call c_utils_vgetinfo_long ( i8ref, i8v )

      ip = loc ( i8v ) 

      write(*,*) 'var i8v =', i8v, ', ref2 =', ip    
      write(*,'(72("-"))')

!
      r4v = -12.345 
      r4 = 123.4567
!
      ip = loc ( r4 ) 

      call f_utils_vgetaddr_float  ( r4, r4ref )
      write(*,*) 'var r4 =', r4, '. var r4v =', r4v, &
         ck_char_lf//ck_char_tab//', ref1 =', r4ref, ', ref2 =', ip 
  

      call c_utils_vgetinfo_float ( r4ref, r4v )

      ip = loc ( r4v ) 

      write(*,*) 'var r4v =', r4v, ', ref2 =', ip    
      write(*,'(72("-"))')
!
!
      r8v = -13.45d0
      r8 = 987654321.4321d0
!
      ip = loc ( r8 ) 

      call f_utils_vgetaddr_double  ( r8, r8ref )
      write(*,*) 'var r8 =', r8, '. var r8v =', r8v, &
         ck_char_lf//ck_char_tab//', ref1 =', r8ref, ', ref2 =', ip 
 
      call c_utils_vgetinfo_double ( r8ref, r8v )

      ip = loc ( r8v ) 

      write(*,*) 'var r8v =', r8v, ', ref2 =', ip    
      write(*,'(72("-"))')


      stop 

      end program t_vgetaddr_02 
