#include <stdio.h>
#include <stdlib.h>

int main ( int nargv, char *cargv[] )
{
   printf ( "\n %d", nargv );
   printf ( "\n %s", *cargv );

   const char* s ;

   for ( int k = 0; k < nargv ; k++ ) 
   {
      printf ( "\narg[%d] = %s\n", k, cargv[k]);

      s = getenv( cargv[k] );
      printf ( 
         "%s = %s\n", 
         cargv[k], 
         (s!=NULL)? s : "getenv returned NULL" );

   }

 
   return 0;
}
