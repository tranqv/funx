////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//

void  c_fputs_ ( FILE **fp, char *str, int *istat )
{
   *istat = fputs ( str, *fp );
}

//
#include <stdint.h>

void  c_fputs_intref_ ( intptr_t *iptr, char *str, int *istat )
{
   *istat = fputs ( str, (FILE *) (*iptr) );
}



//
