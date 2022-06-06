!
!
!
      program t_vgetaddr_01 
!
      use mod_funx_param 
!
      implicit none
!
!     include     'i_param.inc'

      intrinsic   loc 
!
      integer(ck_int)         ::  i4 = 1 
      integer(ck_long)        ::  i8 = 2 
      real(ck_float)          ::  r4 = 3 
      real(ck_double)         ::  r8 = 4 
      complex(ck_float)       ::  c4 = cmplx( 1, 2, kind=ck_float ) 
      complex(ck_double)      ::  c8 = cmplx( 3, 4, kind=ck_double) 

      character         ::  ch = 'v' 
      character(len=10) ::  st = '1234567890' 

      integer(ck_intptr_t)  i4ref, i8ref, r4ref, r8ref, ip, &
                            chref, stref, c4ref, c8ref 

!
      
!
      ip = loc ( i4 ) 

      call f_utils_vgetaddr_int    ( i4, i4ref )
      write(*,*) 'var i4 =', i4, &
         ck_char_lf//ck_char_tab//', ref1 =', i4ref, ', ref2 =', ip 
  

!     call c_utils_vgetinfo ( i4ref )

      ip = loc ( i8 ) 

      call f_utils_vgetaddr_long   ( i8, i8ref )
      write(*,*) 'var i8 =', i8, &
         ck_char_lf//ck_char_tab//', ref1 =', i8ref, ', ref2 =', ip 
!
      ip = loc ( r4 ) 

      call f_utils_vgetaddr_float  ( r4, r4ref )
      write(*,*) 'var r4 =', r4, &
         ck_char_lf//ck_char_tab//', ref1 =', r4ref, ', ref2 =', ip 
!
      ip = loc ( r8 ) 

      call f_utils_vgetaddr_double ( r8, r8ref )
      write(*,*) 'var r8 =', r8, &
         ck_char_lf//ck_char_tab//', ref1 =', r8ref, ', ref2 =', ip 

!
      ip = loc ( ch ) 

      call f_utils_vgetaddr_char ( ch, chref )
      write(*,*) 'var char =', ch, &
         ck_char_lf//ck_char_tab//', ref1 =', chref, ', ref2 =', ip 

!
      ip = loc ( st ) 

      call f_utils_vgetaddr_str ( st, stref )
      write(*,*) 'var string =', st, &
         ck_char_lf//ck_char_tab//', ref1 =', stref, ', ref2 =', ip 

!
      ip = loc ( st(1:1) ) 

      call f_utils_vgetaddr_char ( st(1:1), chref )
      write(*,*) 'var string(1:1) =', st(1:1), &
         ck_char_lf//ck_char_tab//', ref1 =', chref, ', ref2 =',ip 
!
      ip = loc ( c4 ) 

      call f_utils_vgetaddr_float  ( c4, c4ref )
      write(*,*) 'var c4 =', c4, &
         ck_char_lf//ck_char_tab//', ref1 =', c4ref, ', ref2 =', ip 
!
      ip = loc ( c8 ) 

      call f_utils_vgetaddr_double ( c8, c8ref )
      write(*,*) 'var c8 =', c8, &
         ck_char_lf//ck_char_tab//', ref1 =', c8ref, ', ref2 =', ip 









      stop 

      end program t_vgetaddr_01 
