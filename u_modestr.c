/*
   gcc -I ./ t_modestr.c -o t_modestr
*/


#include <sys/stat.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#include "i_utils.h"



int main ( int nargv, char *cargv[] )
{
   char   buf[10] ;
   int    octval ; 
   int    decval ; 

   for ( int k = 0; k < nargv ; k++ ) 
   {
      printf ( "arg[%d] = %s\n", k, cargv[k]);

   }

   if ( nargv < 2 ) return 1 ; 

   strncpy ( buf, cargv[1], 9 ) ; 

// c_utils_strperm_to_octvalu_ ( buf, &octval ) ; 
   c_utils_per2oct_ ( buf, &octval ) ; 

// c_utils_octmode_to_decvalu_ ( &octval, &decval ) ; 
   c_utils_per2dec_ ( buf, &decval ) ; 

   printf ( ">>> string permision: %9s \t octal form: %d \t decimal form: %d\n", 
            buf, octval, decval );
 
   return 0;

} 
