///////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//

void  c_putchar_ ( int *c, int *istat )
{
   *istat = putchar ( *c ) ; 
}

/*
    putchar - put a byte on a stdout stream

SYNOPSIS

    #include <stdio.h>

    int putchar(int c);

DESCRIPTION

    [CX] [Option Start] The functionality described on this reference page is aligned with the ISO C standard. Any conflict between the requirements described here and the ISO C standard is unintentional. This volume of POSIX.1-2017 defers to the ISO C standard. [Option End]

    The function call putchar(c) shall be equivalent to putc(c,stdout).

RETURN VALUE

    Refer to fputc.

ERRORS

    Refer to fputc.


    The putchar() function shall be equivalent to getc(stdin).

RETURN VALUE

    Refer to fgetc.

ERRORS

    Refer to fgetc.

*/
