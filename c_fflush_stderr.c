///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

/*
   flush the STDERR stream 

   istat = 0         success
         = -1 (EOF)  error.
*/

void  c_fflush_stderr_ ( int *istat )
{
   *istat = fflush ( stderr )  ; 
}

//

/*
   SRC: 
      https://pubs.opengroup.org/onlinepubs/9699919799/functions/fflush.html

      If the stream FP points to an output stream or an update stream in which
   the most recent operation was not input, fflush() shall cause 
      any unwritten data for that stream to be written to the file, 
   and 
      the last data modification and last file status change timestamps
   of the underlying file shall be marked for update.

      For a stream open for reading with an underlying file description, if the
   file is not already at EOF, and the file is one capable of seeking, the file
   offset of the underlying open file description shall be set to the file 
   position of the stream, and any characters pushed back onto the stream by
   ungetc() or ungetwc() that have not subsequently been read from the stream
   shall be discarded (without further changing the file offset).

      If stream is a null pointer, fflush() shall perform this flushing action
   on all streams for which the behavior is defined above.

      Upon successful completion, fflush() shall return 
         0, 
   otherwise, it shall set the error indicator for the stream, return 
         EOF, 
   and set errno to indicate the error.


   EXAMPLES

      Sending Prompts to Standard Output

      The following example uses printf() calls to print a series of prompts
   for information the user must enter from standard input. 
      The fflush() calls force the output to standard output. 
      The fflush() function is used because standard output is usually buffered
   and the prompt may not immediately be printed on the output or terminal. 
      The getline() function calls read  strings from standard input and place
   the results in variables, for use later in the program.

    char       *user ;
    char       *oldpasswd ;
    char       *newpasswd ;
    ssize_t    llen ;
    size_t     blen ;
    struct termios term ;
    tcflag_t   saveflag ;

    printf ( "User name: " );
    fflush ( stdout );

    blen = 0;
    llen = getline ( &user, &blen, stdin );

    user[llen-1] = 0;

    tcgetattr ( fileno (stdin), &term );

    saveflag = term.c_lflag;

    term.c_lflag &= ~ECHO ;

    tcsetattr ( fileno(stdin), TCSANOW, &term );

    printf ( "Old password: " );
    fflush ( stdout );

    blen = 0;
    llen = getline ( &oldpasswd, &blen, stdin );

    oldpasswd[llen-1] = 0;

    printf ( "\nNew password: " );
    fflush ( stdout );

    blen = 0;
    llen = getline ( &newpasswd, &blen, stdin );

    newpasswd[llen-1] = 0;
    term.c_lflag = saveflag;

    tcsetattr ( fileno(stdin), TCSANOW, &term );

    free ( user );
    free ( oldpasswd );
    free ( newpasswd );



*/
