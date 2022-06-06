///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

/*
   Rewind to the beginning of STREAM
*/

void  c_frewind_ ( FILE **stream )
{
   rewind ( *stream ) ;
}

//
#include <stdint.h>

void  c_frewind_intref_ ( intptr_t *iptr )
{
   rewind ( (FILE *) (*iptr) ) ;
}

//
