#include <stdio.h>

// To obtain standard IO streames, and assign them to the FILE pointer

void c_fstderr_ ( FILE **fp )
{
   *fp = stderr ;
}

//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//
#include <stdint.h>

void c_fstderr_intref_ ( intptr_t *ifptr )
{
   *ifptr = (intptr_t) (FILE *) stderr ; 
}

//
