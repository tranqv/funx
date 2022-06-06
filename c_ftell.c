///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

// Returns: pos = current file position indicator if OK, -1L on error.

void  c_ftell_ ( FILE **stream, long *pos )
{
   *pos = ftell ( *stream ) ;
}

//
#include <stdint.h>

void  c_ftell_intref_ ( intptr_t *iptr, long *pos )
{
   *pos = ftell ( (FILE *) (*iptr) ) ;
}

/*
   Example: to determine the total length of the stream srcFile (in bytes), 

      fseek ( srcFile, 0, SEEK_END ) ;
      len = ftell ( srcFile ) ;

   Should we rewind the stream for reading from the beginning ?

      rewind ( srcFile ) ; 

   NO. the fseek did set to file possition to the beginning offset=0.

   There are three ways to position a standard I/O stream:

      1. The two functions ftell() and fseek(). They have been around since 
      Version 7, but they assume that a file’s position can be stored in a long
      integer (i.e. 8 bytes).

      2. The two functions ftello() and fseeko(). They were introduced in the 
      Single UNIX Specification to allow for file offsets that might not fit in 
      a long integer. They replace the long integer with the off_t data type, 
      i.e. 8 bytes.

      3. The two functions fgetpos() and fsetpos(). They were introduced by 
      ISO C. They use an abstract data type, fpos_t (18 bytes), that records 
      a file's position. This datatype can be made as big as necessary to
      record a file's  position.

*/


//
