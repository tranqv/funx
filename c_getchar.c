///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//

void  c_getchar_ ( int *c )
{
   *c = getchar() ; 
}

/*
    getchar - get a byte from a stdin stream

    The getchar() function shall be equivalent to getc(stdin).

RETURN VALUE

    Refer to fgetc.

ERRORS

    Refer to fgetc.

*/
