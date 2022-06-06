////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//
//    fread - binary input
//
//    sizeof(char)      = 1   byte
//    sizeof(int)       = 4 
//    sizeof(long)      = 8 
//    sizeof(float)     = 4 
//    sizeof(double)    = 8
//

/*
      Since fread() reads generic data, it DOES NOT care about the NULL 
   character, nor any other special characters. All are read. Maybe 
   this is the reason why fread is fast (maybe the fastest).
      Since 
      1 char = 1 byte 
   we can use this routine to read general data in bytes.
*/
void  c_fread_astr_ ( FILE **fp, char *astr, size_t *n, size_t *m )
{
   size_t nc = (size_t) ( (*n) * sizeof(char) ) ; 
   size_t mc = (size_t) 1 ;
 
// printf ( "nc = %ld \t mc = %ld \n\n", nc, mc ) ; 

   *m = fread ( astr, nc, mc, *fp );
}

////////////////////////////////////////////////////////////////////////////////
//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//
#include <stdint.h>

void  c_fread_astr_intref_ ( 
   intptr_t *ifptr, char *astr, size_t *n, size_t *m )
{
   size_t nc = (size_t) ( (*n) * sizeof(char) ) ; 
   size_t mc = (size_t) 1 ;
   *m = fread ( astr, nc, mc, (FILE *) (*ifptr) );
}

//


////////////////////////////////////////////////////////////////////////////////
/*

#include <stdio.h>
   /usr/include/stdio.h

   +  fread - read chunks of generic data from STREAM.

         size_t fread ( void *ptr, size_t size, size_t nitems, FILE *stream );

         The fread () function shall read into the array pointed to by PTR up 
      to NITEMS elements whose size (of each element) is specified by SIZE 
      in bytes, from the stream pointed to by STREAM. For each object, 
      size calls shall be made to the 
         fgetc() 
      function and the results stored, in the order read, in an array of 
      unsigned char exactly overlaying the object. The file position indicator 
      for the stream (if defined) shall be advanced by the number of 
      bytes successfully read. If an error occurs, the resulting value of the 
      file position indicator for the stream is unspecified. If a partial 
      element is read, its value is unspecified.

         Upon successful completion, fread () shall return the number of elements 
      successfully read which is less than NITEMS only if a read error or end-of-file
      is encountered. If SIZE or NITEMS is 0, fread () shall return 0 and the contents
      of the array and the state of the stream remain unchanged. Otherwise, if a read 
      error occurs, the error indicator for the stream shall be set, and ERRNO shall 
      be set to indicate the error.

      Ex1:
         The following example transfers a single (1 element) 100-byte fixed 
      length record from the fp stream into the array pointed to by buf.

         #include <stdio.h>

         size_t elements_read ;
         char buf[100];
         FILE *fp;

         elements_read = fread ( buf, sizeof(buf), 1, fp );

      If a read error occurs, ELEMENTS_READ will be zero but the number of bytes 
      read from the stream could be anything from zero to sizeof(buf)-1.

      Ex2:
         The following example reads multiple single-byte elements from 
      the fp stream into the array pointed to by buf.

         #include <stdio.h>

         size_t bytes_read;
         char buf[100];
         FILE *fp;

         bytes_read = fread ( buf, 1, sizeof(buf), fp );

      If a read error occurs, BYTES_READ will contain the number of bytes 
      read from the stream.

      NOTE: For reading strings. 
         Since fread() reads generic data, it DOES NOT care about the NULL 
      character, nor any other special characters. All are read. This maybe
      the reason why the speed of fread is rapid (maybe the fastest).

   +  fwrite,  
         size_t fwrite ( const void *ptr, size_t size, size_t n, FILE *s );
       Write chunks of generic data to STREAM.


   +  fgetc - get a byte from a stream

      int fgetc( FILE *stream )

      https://pubs.opengroup.org/onlinepubs/9699919799/functions/fgetc.html

         If the end-of-file indicator for the input stream pointed to by
      STREAM is not set and a next byte is present, the fgetc() function shall
      obtain the next byte as an UNSIGNED CHAR converted to an INT, from the
      input stream pointed to by STREAM, and advance the associated file
      position indicator for the stream (if defined). Since fgetc() operates
      on bytes, reading a character consisting of multiple bytes (or 
      "a multi-byte character") may require multiple calls to fgetc().

         The fgetc() function may mark the last data access timestamp of the
      file associated with stream for update. The last data access timestamp
      shall be marked for update by the first successful execution of fgetc(),
      fgets(), fread(), fscanf(), getc(), getchar(), getdelim(), getline(),
      gets(), or scanf() using stream that returns data not supplied by a prior
      call to ungetc().

      RETURN VALUE

         Upon successful completion, fgetc() shall return 
            the next byte 
      from the input stream pointed to by stream. If the end-of-file indicator
      for the stream is set, or if the stream is at end-of-file, the end-of-file
      indicator for the stream shall be set and fgetc() shall return 
            EOF. 
      If a read error occurs, the error indicator for the stream shall be set,
      fgetc() shall return 
            EOF, 
      and shall set ERRNO to indicate the error.

   +  fgets - get a string from a stream 

         -->>  A string, OK?. Only a string. 
               Dont use for reading a general binary data  <<--

      char *fgets ( char *s, int n, FILE *stream )

      https://pubs.opengroup.org/onlinepubs/9699919799/functions/fgets.html

         The fgets() function shall read bytes from stream into the array 
      pointed to by S until 
         +  n-1 bytes         are read, or 
         +  a <newline>       is read and transferred to S, or 
         +  an end-of-file    condition is encountered. 

      NOTE: 
            A NULL byte shall be written immediately after the last byte
      read into the array. i.e. the n-th byte in S if successful completion.

      If the end-of-file condition is encountered before any bytes are read, the
      contents of the array pointed to by S shall not be changed.

         The fgets() function may mark the last data access timestamp of the 
      file associated with stream for update. The last data access timestamp
      shall be marked for update by the first successful execution of fgetc(),
      fgets(), fread(), fscanf(), getc(), getchar(), getdelim(), getline(), 
      gets(), or scanf() using stream that returns data not supplied by a prior
      call to ungetc(). 

      RETURN VALUE

         Upon successful completion, fgets() shall return 

            S  with the NULL-terminated at the last byte, i.e. 
               the n-th byte in S if S(1:n-1) are fully read. 

         If the stream is at end-of-file, the end-of-file indicator for the 
      stream shall be set and fgets() shall return a 
            NULL pointer. 
         If a read error occurs, the error indicator for the stream shall be
      set, fgets() shall return a null pointer, and shall set ERRNO to indicate
      the error. 

      NOTE: !!!
 
         The fgets() is not safe when the input string contain NULL character.
      This function can not recognize it, hence, it read and thus the string is
      broken due to the null-terminated string of C standard. Be care! 
      Use fgets once  we ensure that the string has no NULL.

   +  getc - get a byte from a stream

      int getc(FILE *stream)
      https://pubs.opengroup.org/onlinepubs/9699919799/functions/getc.html

   +  gets - get a string from a stdin stream

      char *gets(char *s)
      https://pubs.opengroup.org/onlinepubs/9699919799/functions/gets.html

   +  getchar - get a byte from a stdin stream, it shall be equivalent to 
               getc(stdin).

      int getchar(void)

      https://pubs.opengroup.org/onlinepubs/9699919799/functions/getchar.html

   REMARKS:

      From the Advanced Programming in Unix Environment:

      The difference between getc and fgetc is that getc can be implemented as a macro,
   whereas fgetc cannot be implemented as a macro. This means three things:
   +  The argument to getc should not be an expression with side effects.
   +  Since fgetc is guaranteed to be a function, we can take its address. 
      This allows us to pass the address of fgetc as an argument to another function.
   +  Calls to fgetc probably take longer than calls to getc, as it usually 
      takes more time to call a function.

   SRC: https://stackoverflow.com/questions/18480982/getc-vs-fgetc-what-are-the-major-differences


   +  getdelim - read a delimited record from stream

      ssize_t getdelim ( char **lineptr, size_t *n, int delimiter, FILE *stream)



   +  getline - read a delimited record from stream (up to a newline)
      ssize_t getline ( char **lineptr, size_t *n, FILE *stream )




*/
