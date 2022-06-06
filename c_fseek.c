///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

/*
   fseek, fseeko - reposition a file-position indicator in a stream

   fseek sets the file position of the STREAM to the given OFFSET.
   ISTAT =  0  if OK , 
         = -1  on error.
*/

void  c_fseek_ ( FILE **stream, long *offset, int *whence, int *istat )
{
   *istat = fseek ( *stream, *offset, *whence );
}

////////////////////////////////////////////////////////////////////////////////
//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//
#include <stdint.h>

void  c_fseek_intref_ ( 
   intptr_t *iptr, long *offset, int *whence, int *istat )
{
   *istat = fseek ( (FILE *) (*iptr), *offset, *whence );
}


////////////////////////////////////////////////////////////////////////////////
/*
   The possibilities for the argument WHENCE in fseek():

      SEEK_SET =  0	Seek from beginning of file. 
      SEEK_CUR =  1	Seek from current position.  
      SEEK_END =  2	Seek from end of file.  


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
