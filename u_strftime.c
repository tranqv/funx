#include <stdio.h>
#include <time.h>

int main ( int nargv, char *cargv[] )
{
    time_t     rawtime ;
    struct tm  ts;
    char       buf[30];

   for ( int k = 0; k < nargv ; k++ ) 
   {
      printf ( "arg[%d] = %s\n", k, cargv[k]);

   }

   if ( nargv < 2 ) return 1 ; 


   sscanf  ( cargv[1], "%ld", &rawtime );


    // Format time, "ddd yyyy-mm-dd hh:mm:ss zzz"

    ts = *localtime ( &rawtime );

    strftime ( buf, sizeof(buf), "%a %Y-%m-%d %H:%M:%S %Z", &ts );

    printf ( "rawtime = %ld  -->  readable time = %s\n", rawtime, buf );

    return 0;
}

