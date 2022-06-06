/*
   /usr/include/time.h

      extern char *asctime (const struct tm *__tp) __THROW;

         Return a string of the form "Day Mon dd hh:mm:ss yyyy\n"
         that is the representation of TP in this format.  

      extern char *ctime (const time_t *__timer) __THROW;

          Equibufent to `asctime (localtime (timer))'.  

      Ex: TIM = 1583171848  -->  STR = 'Mon Mar  2 18:01:04 2020'
   
   NOTE: ctime may exceed the max-length of PTR. Use strftime instead.
*/

#include <time.h>
#include <string.h>
#include <errno.h>


void  c_ctime_ ( time_t *tim, char *buf, size_t *len_buf, size_t *lentrim_buf )
{
   char *ptr = ctime ( tim ) ;

   if ( ptr == NULL )
   {
/*
      The provided name does not exists as an env-varable. Exit and Report.
*/
      *lentrim_buf = 0 ;      
      errno = EDOM ; 
   }
   else
   {
/*
      We need to not only remove 
         \0 (NULL) 
      character which marks the end of C-strings, but also to remove
         \n (Newline)
      character, which is fro mthe output of ctime(). So the output 
         lentrim_buf
      should be subtracted from 1. 
*/
      size_t dump = strlen ( ptr ) ; 
      size_t dumv = *len_buf - 1 ;
 
      strncpy ( buf, ptr, dumv ) ;
/*
      Perfoming 
         *lentrim_buf = ( dump > dumv )? dumv : dump  ;  
*/
      if ( dump > dumv )
      {
/*
         The room of VAL is so small that it cannot store PTR. Increase it.
         Report: 
         errno = ERANGE
*/
         *lentrim_buf = dumv - 1 ;
         errno = ERANGE ; 
      }
      else
      {
/*
         Normal exit. 
         Report: 
         errno = 0
*/
         *lentrim_buf = dump - 1 ; 
         errno = 0 ;
      }
   }
}
