#include <stdio.h>

// To obtain standard IO streames, and assign them to the FILE pointer

void c_fstdout_ ( FILE **fp )
{
   *fp = stdout ;
}

//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//
#include <stdint.h>

void c_fstdout_intref_ ( intptr_t *ifptr )
{
   *ifptr = (intptr_t) (FILE *) stdout ; 
}

//
