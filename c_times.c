/*
   /usr/include/time.h
      time_t, clock_t, 

*  POSIX Standard: 4.5.2 Process Times	<sys/times.h>
   /usr/include/x86_64-linux-gnu/sys/times.h
     tms, times,  

!     obtaining 
!     +  utime     User CPU time.    
!     +  stime     System CPU time.    
!     +  cutime    User CPU time of dead children.    
!     +  cstime    System CPU time of dead children. 

*/
#include <sys/times.h>

clock_t  c_times_ ( 
   clock_t *utime, clock_t *stime, clock_t *cutime, clock_t *cstime 
)
{
   struct tms buf ;
   return times ( &buf ) ;

   *utime = buf.tms_utime ; 
   *stime = buf.tms_stime ;
   *cutime = buf.tms_cutime ; 
   *cstime = buf.tms_cstime ;
}
