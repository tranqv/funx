
/*
   The best example of reference (&) / dereference (*)
*/

#include <stdio.h>
#include <string.h>

#include <stdint.h>
#include "i_utils.h"

/*
void  c_utils_vgetaddr_ ( void *, intptr_t * ) ; 
void  c_utils_vgetinfo_int_ ( intptr_t *, int * ) ;
void  c_utils_vgetinfo_long_ ( intptr_t *, long * ) ;
void  c_utils_vgetinfo_float_ ( intptr_t *, float * ) ;
void  c_utils_vgetinfo_double_ ( intptr_t *, double * ) ;

void  c_utils_vgetleng_char_ ( intptr_t *, size_t * ) ;
void  c_utils_vgetinfo_char_ ( intptr_t *, char *, size_t * ) ;
*/


int main ( void )
{
// const size_t   N = 10; 
   const size_t   N = 500000; 
   double         x [N] ; 
   intptr_t       id[N] ; 

   for ( size_t i = 0; i < N; i++) 
   {
      x[i] = (double ) i * 10 ; 
   }


   double   t ;


   for ( size_t i = 0; i < N; i++) 
   {
      c_utils_vgetaddr_ ( &x[i], &id[i] ) ; 
   }


   for ( size_t i = 0; i < N; i++) 
   {
      c_utils_vgetinfo_double_ ( &id[i], &t ) ;
//    printf (  "i = %9ld  id[i] = %p      %ld,      t = %e \n",  
//                   i,   (void *) id[i],  id[i],      t ) ;
   }







/*
   for ( size_t i = 0; i < N; i++) 
   {
      t = x[i] ; 
//    printf (  "i = %9ld  p = %p    %ld,      *p = %e \n",  
//                   i,        p,    (long) p,      t ) ;
   }

*/


//
   return 0 ; 
}
