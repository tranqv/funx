/*
   gcc -I ./ t_modedec.c -o t_modedec
*/


#include <sys/stat.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#include "i_utils.h"



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


   sscanf  ( cargv[1], "%d", &decval );

// octval  =  (mode_t) decval ; 

// c_utils_decmode_to_octvalu_ ( &decval, &octval ) ; 
   c_utils_dec2oct_ ( &decval, &octval ) ; 

/*
   WRONG!
   c_utils_octmode_to_strperm_ ( &octval, buf ) ; 
*/
// c_utils_octmode_to_strperm_ ( &decval, buf ) ; 
   c_utils_dec2per_ ( &decval, buf ) ; 

   printf ( ">>> decimal form: %d \t string permision: %9s \t octal form: %d\n", 
            decval, buf, octval );
 
   return 0;

} 
