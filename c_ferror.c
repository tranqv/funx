///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

/*
   return: istat = nonzero (true)  if error on stream, 
                 = 0       (false) otherwise.
*/

void  c_ferror_ ( FILE **stream, int *istat )
{
   *istat = ferror ( *stream ) ;
}

//
//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//

#include <stdint.h>

void  c_ferror_intref_ ( intptr_t *ifptr, int *istat )
{
   *istat = ferror ( (FILE *) (*ifptr) ) ;
}


//
