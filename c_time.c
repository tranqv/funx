/*
   /usr/include/time.h
      time_t, clock_t, 
*/
#include <time.h>

time_t c_time_ ()
{
   return time ( NULL );
}
