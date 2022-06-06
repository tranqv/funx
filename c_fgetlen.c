///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

// len = the length of stream.

void  c_fgetlen_ ( FILE **fp, long *len )
{
//
// Seeking for the offset 0 from the end of the stream *fp:
   fseek ( *fp, 0, SEEK_END ) ;
// 
// and getting that value (in byte):
   *len = ftell ( *fp ) ;
//
// Rewind the stream for other tasks. Is it necessary ? NO
//    rewind ( *fp ) ; 
// Since the fseek() did set the file position to offset=0.
//
}

//
#include <stdint.h>

void  c_fgetlen_intref_ ( intptr_t *iptr, long *len )
{
   FILE *fp ;
   fp = (FILE *) (*iptr) ;
   fseek ( fp, 0, SEEK_END ) ;
   *len = ftell ( fp ) ;
}
