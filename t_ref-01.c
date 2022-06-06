
/*
   The best example of reference (&) / dereference (*)

   gcc -Wall t_ref-01.c 
*/

#include <stdio.h>
#include <string.h>
#include <dirent.h>     // for "DIR *"

int main ( void )
{
   printf ( "\n-------You should know what I mean-------\n\n") ; 

   printf ( "sizeof(char  *) = %ld\n", sizeof(char  *)  ) ; 
   printf ( "sizeof(int   *) = %ld\n", sizeof(int   *)  ) ; 
   printf ( "sizeof(long  *) = %ld\n", sizeof(long  *)  ) ; 
   printf ( "sizeof(float *) = %ld\n", sizeof(float *)  ) ; 
   printf ( "sizeof(double*) = %ld\n", sizeof(double*)  ) ; 
   printf ( "sizeof(FILE  *) = %ld\n", sizeof(FILE  *)  ) ; 
   printf ( "sizeof(DIR   *) = %ld\n", sizeof(DIR   *)  ) ; 

   printf ( "\n-----use INTEGER(8) for pointer!---------\n\n") ; 

   int x;
   int *p;       // * is used in the declaration:
               // p is a pointer to an integer, since (after dereferencing),
               // *p is an integer

   x = 0;        // now x == 0 
   p = &x;       // & takes the reference (address) of x
               // now *p == 0, since p == &x and therefore *p == x
   *p = 1;       // equivalent to x = 1, since p == &x
               // now *p == 1 and x == 1

   printf ( " p = %p,  &x = %p\n",  p, &x  ) ; 

   printf ( "*p = %d,   x = %d\n", *p, x  ) ; 

//
   void * q ; 

   q = &x ; 
   printf ( " q = %p   %li\n",  q, (long) q  ) ; 
//
   long  l ;

   l = (long) q ; 

   printf ( " l = %li \n\n", l ) ; 
//
// How to dererence from the interger (8 bytes) value of reference
// Here:
//
// Method 1:
   void * r ; 

// r = l ;           // it works, but with warning " without a cast "
   r = (int *) l;    // fixed

   printf ( " r = %p \n", r ) ; 
//
   int *ir ; 

   ir =  r ; 

   printf ( "*ir = %d \n", *ir ) ; 
//
   *ir = 100 ;

   printf ( "*ir = %d \n", *ir ) ; 

   printf ( " p = %p,  &x = %p\n",  p, &x  ) ; 

   printf ( "*p = %d,   x = %d\n\n", *p, x  ) ; 

//
//
// Method 2:
   int *is ; 

// is = l ;             // it works, but with warning " without a cast "
   is = (int *) l ;     // where int* is due to 

   printf ( "*is = %d,   *is = %p \n", *is, is ) ; 
//
   *is = 234 ;

   printf ( "*ir = %d \n", *ir ) ; 

   printf ( " p = %p,  &x = %p\n",  p, &x  ) ; 

   printf ( "*p = %d,   x = %d\n\n", *p, x  ) ; 


//
   return 0 ; 
}
