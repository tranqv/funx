!
!
!
      program t_vgetaddr_03 
!
      use mod_funx_param 
!
      implicit none
!
      intrinsic   loc 
!
      character               ch, chv 
      character(len=10)       st 
      character(len=20)       stv 
      integer(ck_intptr_t)    chref, stref, ip 
      integer(ck_size_t)      len_st, lt 
!
!
      write(*,*) 'CH is len=1:'

      chv = '?'
      ch = 'v'

      write(*,*) 'var ch  = ', ch
      write(*,*) 'var chv = ', chv

!
      ip = loc ( ch ) 
      call f_utils_vgetaddr_char   ( ch, chref )

      write(*,*) 'ref1 ch = ', chref
      write(*,*) 'ref2 ch = ', ip 
  

      lt = 1 
      call c_utils_vgetinfo_char ( chref, chv, lt, lt )

      write(*,*) 'var chv = ', chv

      ip = loc ( chv ) 
      call f_utils_vgetaddr_char   ( chv, chref )

      write(*,*) 'ref1chv = ', chref
      write(*,*) 'ref2chv = ', ip 

      write(*,'(72("-"))')


!
!
      write(*,*) 'ST goes without NULL terminating:'

      stv = '?'
      st = 'viet'

      write(*,*) 'var st  = ', st
      write(*,*) 'var stv = ', stv
!
      ip = loc ( st ) 
      call f_utils_vgetaddr_char   ( st, stref )

      write(*,*) 'ref1st  = ', stref
      write(*,*) 'ref2st  = ', ip 
 

      call c_utils_vgetleng_char ( stref, len_st  )
      write(*,*) 'len_st  = ', len_st

      lt = len(st) 
      call c_utils_vgetinfo_char ( stref, stv, lt, lt  )
      write(*,*) 'var stv = ', stv
      write(*,*) 'len_trim (st) = ', len_trim(st)


      call f_utils_vgetaddr_char   ( st, stref )
      ip = loc ( stv ) 

      write(*,*) 'ref1stv = ', stref 
      write(*,*) 'ref2stv = ', ip 

      write(*,'(72("-"))')    
!   
!     You will see that 
!
!        len_st = len(st) + len(stv)
!
!     Why? Since st and stv are next in memory (optimization compiler)
!     Try again with NULL_terminated 
!
      write(*,*) 'Adding NULL the tail of ST:'

      st = 'viet'//ck_char_nul    ! <----- LOOK how to terminate C-strings 

      write(*,*) 'var st  = ', st
!
      ip = loc ( st ) 
      call f_utils_vgetaddr_char   ( st, stref )

      write(*,*) 'ref2st  = ', ip 
      write(*,*) 'ref1st  = ', stref

      call c_utils_vgetleng_char ( stref, len_st, len_st  )
      write(*,*) 'len_st  = ', len_st

!
!     again 
!
      stv = '' 
      lt = 3 
      call c_utils_vgetinfo_char ( stref, stv, lt, lt )

      write(*,*) 'var stv = ', stv

      call f_utils_vgetaddr_char   ( stv, stref )
      ip = loc ( stv ) 

      write(*,*) 'ref1stv = ', stref 
      write(*,*) 'ref2stv = ', ip 

      write(*,*) 'len_trim (st) = ', len_trim(st)

      write(*,'(72("-"))')    
! 
!     Now 
!
!        len_st = len_trim(st)  ! remove the trailing NULL 
!
!     Why? Since st and stv are next in memory (optimization compiler)
!     Try again with NULL_terminated 
!





      stop 

      end program t_vgetaddr_03 
