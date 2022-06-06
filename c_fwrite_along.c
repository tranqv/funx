////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//
//    fwrite - binary output
//
//    sizeof(char)      = 1
//    sizeof(int)       = 4 
//    sizeof(long)      = 8 
//    sizeof(float)     = 4 
//    sizeof(double)    = 8
//

void  c_fwrite_along_ ( FILE **fp, const long *al, size_t *n, size_t *m )
{
   size_t nc = (size_t) ( (*n) * sizeof(long) ) ; 
   size_t mc = (size_t) 1 ;

   *m = fwrite ( al, nc, mc, *fp );
}

////////////////////////////////////////////////////////////////////////////////
//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//
#include <stdint.h>

void  c_fwrite_along_intref_ ( 
   intptr_t *iptr, const long *al, size_t *n, size_t *m )
{
   size_t nc = (size_t) ( (*n) * sizeof(long) ) ; 
   size_t mc = (size_t) 1 ;
   *m = fwrite ( al, nc, mc, (FILE *) (*iptr) );
}

////////////////////////////////////////////////////////////////////////////////
/*

#include <stdio.h>
   /usr/include/stdio.h

   +  fwrite - binary output

      size_t fwrite ( const void *ptr, size_t size, size_t nitems, FILE *stream );

      The fwrite () function shall write, from the array pointed to by PTR, up 
   to NITEMS elements whose size is specified by SIZE, to the stream pointed 
   to by STREAM. For each object, the number SIZE of calls shall be made to the 
      fputc() 
   function, taking the values (in order) from an array of unsigned char exactly
   overlaying the object. The file-position indicator for the stream (if defined)
   shall be advanced by the number of bytes successfully written. If an error 
   occurs, the resulting value of the file-position indicator for the stream is 
   unspecified.

      The last data modification and last file status change timestamps of the 
   file shall be marked for update between the successful execution of fwrite () 
   and the next successful completion of a call to fflush() or fclose() on the 
   same stream, or a call to exit() or abort(). 

   RETURN VALUE

      The fwrite () function shall 
         return the number 
   of elements successfully written, which may be less than NITEMS if a write 
   error is encountered. If SIZE or NITEMS is 0, fwrite () shall 
         return 0 
   and the state of the stream remains unchanged. Otherwise, if a write error
   occurs, the error indicator for the stream shall be set, and ERRNO shall be
   set to indicate the error.

   +  fputc - put a byte on a stream

      int fputc ( int c, FILE *stream )

      https://pubs.opengroup.org/onlinepubs/9699919799/functions/fputc.html

         The fputc() function shall write the byte specified by C 
      (Note: C is integer (4-bytes). It then is converted to an unsigned char),

         i.e.
         -  signed char    range -127 to 127. (-128 to 127 is common) (1 byte)
         -  unsigned char  range 0 to 255                             (1 byte?)
         -  char           stands for both signed or unsigned.        (1 byte)

         ==>   C is converted to integer (4-bytes). Not optimized!
               Why dont we use integer(kind=2) in Fortran? OK?
         ==>   Use ICHAR in Fortran for conversion

               Name        Argument          Return type    Standard
               ICHAR(C)    CHARACTER(1) C    INTEGER(4)     Fortran 77 and later

               int fputc ( ICHAR(c), FILE *stream )

      to the output stream pointed to by STREAM, at the position indicated by
      the associated file-position indicator for the stream (if defined), 
      and shall advance the indicator appropriately. If the file cannot support
      positioning requests, or if the STREAM was opened with append mode, 
      the byte shall be appended to the output stream.

         The last data modification and last file status change timestamps
      of the file shall be marked for update between the successful execution
      of fputc() and the next successful completion of a call to fflush() or
      fclose() on the same stream or a call to exit() or abort(). 

      RETURN VALUE

         Upon successful completion, fputc() shall return 
            the value it has written. 
      Otherwise, it shall return 
            EOF, 
      the error indicator for the stream shall be set, and ERRNO shall be set 
      to indicate the error.


   +  fputs - put a string on a stream

      int fputs ( const char *s, FILE *stream )

      https://pubs.opengroup.org/onlinepubs/9699919799/functions/fputs.html

         The fputs() function shall write the NULL-terminated string pointed
      to by S to the stream pointed to by STREAM. The terminating NULL byte 
      shall not be written.

         The last data modification and last file status change timestamps of
      the file shall be marked for update between the successful execution of
      fputs() and the next successful completion of a call to fflush() or 
      fclose() on the same stream or a call to exit() or abort().

      RETURN VALUE

         Upon successful completion, fputs() shall return 
            a non-negative number
      Otherwise, it shall return 
            EOF, 
      set an error indicator for the stream, and set errno to indicate the error.

      EXAMPLES

            Printing to Standard Output
            The following example gets the current time, converts it to a 
         string using localtime() and asctime(), and prints it to standard 
         output using fputs(). It then prints the number of minutes to an 
         event for which it is waiting.

            #include <time.h>
            #include <stdio.h>

            time_t now ;
            int minutes_to_event ;

            time ( &now );
            printf ( "The time is " ) ;

            fputs ( asctime(localtime(&now)), stdout ) ;

            printf ( "There are still %d minutes to the event.\n",
                     minutes_to_event ) ;

   +  putc - put a byte on a stream

      int putc ( int c, FILE *stream );
      https://pubs.opengroup.org/onlinepubs/9699919799/functions/putc.html

   +  puts - put a string on standard output

      int puts ( const char *s );
      https://pubs.opengroup.org/onlinepubs/9699919799/functions/puts.html

   +  putchar - put a byte on a stdout stream

      int putchar(int c);
      https://pubs.opengroup.org/onlinepubs/9699919799/functions/putchar.html

   +  fprintf 

         int fprintf ( FILE *stream, const char *format, ... );

















*/
