////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <string.h>

/*
   In the codes below, the output 
      *lentrim_s  
   stands for the number of bytes which are read successfully.
   So, the offset should be advanced like this: 
      offset = offset +  *lentrim_s
*/

void  c_fgets_stdin_ ( char *s, int *len_s, int *lentrim_s )
{
   char *ptr = fgets ( s, *len_s, stdin ) ;

   if ( ptr == NULL )  
   {
      *lentrim_s = 0;
   }
   else
   {
      *lentrim_s = (int) strlen ( s ) ; 
   }
}

