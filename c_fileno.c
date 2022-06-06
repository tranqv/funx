///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//

void  c_fileno_ ( FILE **fp, int *fno ) 
{
   *fno = fileno ( *fp ) ; 
}

//
#include <stdint.h>

void  c_fileno_intref_ ( intptr_t *iptr, int *fno ) 
{
   *fno = fileno ( (FILE *) (*iptr) ) ; 
}

/*
NAME

    fileno - map a stream pointer to a file descriptor

SYNOPSIS

    [CX] [Option Start] #include <stdio.h>

    int fileno(FILE *stream); [Option End]

DESCRIPTION

    The fileno() function shall return the integer file descriptor associated with the stream pointed to by stream.

RETURN VALUE

    Upon successful completion, fileno() shall return the integer value of the file descriptor associated with stream. Otherwise, the value -1 shall be returned and errno set to indicate the error.

ERRORS

    The fileno() function shall fail if:

    [EBADF]
        The stream is not associated with a file.

    The fileno() function may fail if:

    [EBADF]
        The file descriptor underlying stream is not a valid file descriptor.

Src:
   https://pubs.opengroup.org/onlinepubs/9699919799/functions/fileno.html
*/
