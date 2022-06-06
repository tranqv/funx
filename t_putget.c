
// not work 

#include <stdio.h>
#include <stdlib.h>

#include <x_putget.c>


int main ( void )
{

   char *s = "?" ; 

   ssize_t  i = 0 ; 

   for (;;)
   {

      i = c_getkey_ ( s ) ; 

      if ( i == -1 || i == 0 )
      {
         break ; 
      }
      else 
      {
         if ( *s == 10  )
         {
            printf ( "%s\n\n", "Bye." ) ; 
            break ; 
         }
         else
         {
            printf ( "%c", *s ) ; 
         }
         continue ;
      }

   }
 
   return 0;
}
