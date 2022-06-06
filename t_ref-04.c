
/*
   Test for casting types. The casting is extremely fast.
*/

#include <stdio.h>
#include <string.h>

#include <stdint.h>

// #include "i_utils.h"


intptr_t   itmp ; 

// single work:

intptr_t  donothing1 ( FILE *fp )
{
// return (intptr_t) (void *) fp ; 

   itmp = (intptr_t) (void *) fp ; 
// printf ( "itmp = %p  %ld \n", (void *) (itmp), (long) (itmp) ) ;    
   return itmp ;
}

// double works:

intptr_t  donothing2 ( intptr_t *iptr )
{
   FILE * fp = (FILE *) (*iptr)  ;

   itmp = (intptr_t) (void *) fp ; 
// printf ( "itmp = %p  %ld \n", (void *) (itmp), (long) (itmp) ) ;    

   return itmp ;
}


///////////////

int main ( void )
{
// const size_t   N = 10; 
   const size_t   N = 50000000; 
   intptr_t       iptr ; 

// Method 1:
   iptr = (intptr_t) (FILE *) fopen ( "./z-pipe.vim", "r" ) ; 

// Method 2: the following call shows an equivalent performance:
// c_fopen_intref_ ( &iptr, "./z-pipe.vim", "r" ) ;

   printf ( "iptr = %p  %ld \n", (void *) (iptr), (long) (iptr) ) ;  

   for ( size_t i = 0; i < N; i++) 
   {
//    donothing1 ( (FILE *) (&iptr) ) ;
      iptr = iptr + 1 ; 
//    iptr = iptr - 1 ; 
      donothing2 ( &iptr ) ;
   }

   printf ( "iptr = %p  %ld \n", (void *) (iptr), (long) (iptr) ) ;  

//
   return 0 ; 
}


