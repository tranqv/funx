///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <sys/types.h>

// Output istat = 0 if OK, -1 on error.

void  c_fseeko_ ( FILE **stream, off_t *offset, int *whence, int *istat )
{
   *istat = fseeko ( *stream, *offset, *whence );
}

//
#include <stdint.h>

void  c_fseeko_intref_ ( 
   intptr_t *iptr, off_t *offset, int *whence, int *istat )
{
   *istat = fseeko ( (FILE *) (*iptr), *offset, *whence );
}

//
