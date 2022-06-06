/*
   gcc -I ./ t_modeoct.c -o t_modeoct
*/


#include <sys/stat.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#include "i_utils.h"


//void octmode_to_strperm ( mode_t, char * ) ;


int main ( int nargv, char *cargv[] )
{
   char  buf[10] ;
   int   octval ; 
   int   decval ; 

   for ( int k = 0; k < nargv ; k++ ) 
   {
      printf ( "arg[%d] = %s\n", k, cargv[k]);

   }

   if ( nargv < 2 ) return 1 ; 

   sscanf  ( cargv[1], "%d", &octval );

// c_utils_octmode_to_decvalu_ ( &octval, &decval ) ; 
   c_utils_oct2dec_ ( &octval, &decval ) ; 

/*
   WRONG!
   c_utils_octmode_to_strperm_ ( &octval, buf ) ;
*/

// c_utils_octmode_to_strperm_ ( &decval, buf ) ; 
   c_utils_oct2per_ ( &octval, buf ) ; 

   printf ( 
      ">>> octal form: %04d \t string permision: %9s \t decimal form: %d\n", 
      octval, buf, decval );
 
   return 0;

} 
