!-----------------------------------------------------------------------
!
!     obtaining 
!     +  utime     User CPU time.    
!     +  stime     System CPU time.    
!     +  cutime    User CPU time of dead children.    
!     +  cstime    System CPU time of dead children. 
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_times ( utime, stime, cutime, cstime ) 
!
      use mod_funx_param, only: ck_clock_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_clock_t),intent(out) ::  utime
      integer(kind=ck_clock_t),intent(out) ::  stime
      integer(kind=ck_clock_t),intent(out) ::  cutime
      integer(kind=ck_clock_t),intent(out) ::  cstime 
!
      external    c_times 
!
!
      call c_times ( utime, stime, cutime, cstime )
!
      return 
      end subroutine f_times
!
!-----------------------------------------------------------------------
!
