////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//
//    Upon successful completion, c_fputc() shall give ISTAT 
//          the value it has written. 
//    Otherwise, it shall give 
//          EOF, 
//    the error indicator for the stream shall be set, and ERRNO shall be set 
//    to indicate the error.
//

void  c_fputc_stdout_ ( int *c, int *istat )
{
   *istat = fputc ( *c, stdout );
}

//
