

#include <stdio.h>
#include <string.h>

int main ( int nargv, char *cargv[] )
{
   printf ( "\n %d", nargv );
   printf ( "\n %s", *cargv );

   char *s ;

   for ( int k = 0; k < nargv ; k++ ) 
   {
      printf ( "\narg[%d] = %s\n", k, cargv[k]);

      strcpy ( s, cargv[k] ) ;

      printf (  "S string = %s, %d \t\t %s, %d \n", s, s, cargv[k], cargv[k] );
   }

   char *const p = "tran quoc viet" ; 

   printf (  "P string = %s, %d \n", p, p + strlen(p) );

   char *const q = "tran quoc viet" ; 

   printf (  "Q string = %s, %d \n", q, q + strlen(q) );

 
   return 0;
}








