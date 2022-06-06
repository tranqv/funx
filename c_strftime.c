/*
   Convert from epoch to human-readable date/time 
   https://www.epochconverter.com/programming/c
*/

#include <time.h>
#include <string.h>
#include <stdio.h>

void  c_strftime_ ( 
   time_t *rawtime, char *str, size_t *len_str, size_t *lentrim_str 
)
{
   struct tm  ts;

   ts = *localtime ( rawtime );

   strftime ( str, *len_str, "%a %Y-%m-%d %H:%M:%S %Z", &ts );

   size_t ilen = strlen( str )  ; 

   if ( ilen < 27 ) 
   {
      printf ( 
         "\nWARNING: c_strftime.c, length of STR is so short (= %lu). "
         "It should at least be 28.\n\n", *len_str ) ; 
   }

   *lentrim_str = ilen ; 
}
