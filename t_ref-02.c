
/*
   The best example of reference (&) / dereference (*)
*/

#include <stdio.h>
#include <string.h>

int main ( void )
{
   const size_t   N = 500000; 
   double x [N] ; 

   for ( size_t i = 0; i < N; i++) 
   {
//    x[i] = (double ) i / (double) (i+1)  ; 
      x[i] = (double ) i * 10 ; 
   }



   void     *p ; 
   double   t ;

   for ( size_t i = 0; i < N; i++) 
   {
      p = &x[i] ; 
      t = (* (double *) p) ; 
//    printf (  "i = %9ld  p = %p    %ld,      *p = %e \n",  
//                   i,        p,    (long) p,      t ) ;
   }

   for ( size_t i = 0; i < N; i++) 
   {
//    p = &x[i] ; 
//    t = (* (double *) p) ; 
      t = x[i] ;
//    printf (  "i = %9ld  p = %p    %ld,      *p = %e \n",  
//                   i,        p,    (long) p,      t ) ;
   }

//
   return 0 ; 
}
