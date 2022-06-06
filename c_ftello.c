///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <sys/types.h>

// Returns: current file position indicator if OK, (off_t) -1 on error.

void  c_ftello_ ( FILE **stream, off_t *pos )
{
   *pos = ftello ( *stream ) ;
}

//

#include <stdint.h>

void  c_ftello_intref_ ( intptr_t *iptr, off_t *pos )
{
   *pos = ftello ( (FILE *) (*iptr) ) ;
}



