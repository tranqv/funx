/* 
   clock_t RES = clock ( void ) ;

      Time used by the program so far (user time + system time).

   where 

      clock_t is C-kind defined in #include <time.h>, i.e. 
         /usr/include/time.h

      CLOCKS_PER_SEC is constant defined in <bits/time.h>, i.e. 
         /usr/include/x86_64-linux-gnu/bits/time.h

      RES is the result in clock_t kind, 
         RES / CLOCKS_PER_SEC is program time in seconds, 
*/

#include <time.h>
#include <bits/time.h>

void c_clock_ ( double *dtim )
{
   clock_t isec = clock () ;
   *dtim = (double) isec / CLOCKS_PER_SEC ; 
}









