#include <stdio.h>
#include <errno.h>

void  c_perror_ ( char * str, int * errc )
{
    errno = *errc ;
    perror ( str ) ;
}

/*
   REF: 

   /usr/include/errno.h
   +  errno 

   /usr/include/stdio.h
   +  perror
*/
