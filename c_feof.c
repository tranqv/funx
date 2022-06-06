///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

/*
   return: istat = nonzero (true)  if end of file on stream, 
                 = 0       (false) otherwise.
*/

void  c_feof_ ( FILE **stream, int *istat )
{
    *istat = feof ( *stream ) ;
}

//

#include <stdint.h>

void  c_feof_intref_ ( intptr_t *ifptr, int *istat )
{
    *istat = feof ( (FILE *) (*ifptr) ) ;
}

//
