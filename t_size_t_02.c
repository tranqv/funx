/*
    According to the 1999 ISO C standard (C99), size_t is an unsigned integer type of at least 16 bit (see sections 7.17 and 7.18.3).

    size_tis an unsigned data type defined by several C/C++ standards, e.g. the C99 ISO/IEC 9899 standard, that is defined in stddef.h.1 It can be further imported by inclusion of stdlib.h as this file internally sub includes stddef.h.

    This type is used to represent the size of an object. Library functions that take or return sizes expect them to be of type or have the return type of size_t. Further, the most frequently used compiler-based operator sizeof should evaluate to a constant value that is compatible with size_t.

-->   As an implication, size_t is a type guaranteed to hold any array index.

*/

#include <stdio.h>
#include <stddef.h>
#include <stdint.h>
 
int main ( void )
{
   const size_t N = 100 ;
   int numbers[N] ;

   for ( size_t ndx = 0; ndx < N; ++ndx )
   {
      numbers[ndx] = ndx;
   }

   printf ( "SIZE_MAX = %zu (%s)\n", SIZE_MAX, "\%zu" );
   printf ( "SIZE_MAX = %u  (%s)\n", SIZE_MAX, "\%u" );
   printf ( "SIZE_MAX = %d  (%s)\n", SIZE_MAX, "\%d" );

   size_t size = sizeof( numbers ) ;

   printf ( "Total size of the array = %zu (%s)\n", size, "\%zu" );
   printf ( "Total size of the array = %d  (%s)\n", size, "\%d" );
   printf ( "sizeof(size_t) = %zu (%s)\n", (int) sizeof(size_t), "\%zu" );
   printf ( "sizeof(size_t) = %u  (%s)\n",       sizeof(size_t), "\%u" );
   printf ( "sizeof(size_t) = %d  (%s)\n",       sizeof(size_t), "\%d" );
}
