////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

/*
   Set STREAM's position.
      istat =  0        if OK, 
            =  nonzero  on error.

   Introduced by ISO C standard.
*/

void  c_fsetpos_ ( FILE **fp, const fpos_t *pos, int *istat ) 
{
   *istat = fsetpos ( *fp, pos ) ; 
}

//
#include <stdint.h>

void  c_fsetpos_intref_ ( intptr_t *iptr, const fpos_t *pos, int *istat ) 
{
   *istat = fsetpos ( (FILE *) (*iptr), pos ) ; 
}


/*
      The fgetpos() function stores the current value of the file's position
   indicator in the object pointed to by POS. This value can be used in a 
   later call to fsetpos() to reposition the stream to that location.

   NOTE: fpos_t = 16, hence POS in integer(kind=16) is very large.

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
