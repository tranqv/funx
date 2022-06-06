#include <stdlib.h>
#include <string.h>
#include <errno.h>

//#include <stdio.h>

///////////////////////////////////////////////////////////////////////////////
//
// We can work with array of character.
//
//    char* val = character val(len_val)
//

void  c_getenv_ ( 
   const char *nam, char *val, size_t *len_val, size_t *lentrim_val 
)
{
   char *ptr = getenv ( nam ) ;

// printf ( "nam = %s   len = %d\n", nam, (int) strlen(nam) );
// printf ( "ptr = %s\n", ptr );

   if ( ptr == NULL )
   {
//
//    The provided name does not exists as an env-variable. Exit and Report.
//
      *lentrim_val = 0 ;      
      errno = EEXIST ; 
   }
   else
   {
      size_t dump = strlen ( ptr ) ; 
      size_t dumv = *len_val - 1 ;
 
      strncpy ( val, ptr, dumv ) ;
//
//    Perfoming 
//       *lentrim_val = ( dump > dumv )? dumv : dump  ;  
//
      if ( dump > dumv )
      {
//
//       The room of VAL is so small that it cannot store PTR. Increase it.
//       Report: 
//       errno = ERANGE
//
         *lentrim_val = dumv ;
         errno = ERANGE ; 
      }
      else
      {
//
//       Normal exit. 
//       Report: 
//       errno = 0
//
         *lentrim_val = dump ; 
         errno = 0 ;
      }

//    printf ( "val = %s\n\n", val );
   }
}

///////////////////////////////////////////////////////////////////////////////
//
// to work with allocatable array of character. Later on, we use this for 
// str as type(string).
//

char * c_getenv_TmpBuff ;

// To obtain the length of string, i.e. len_val (not counting NULL) 

void  c_getenv_prep_ ( const char *nam, size_t *len_val )
{
   char *ptr = getenv ( nam ) ;

   if ( ptr == NULL )
   {
      *len_val = 0 ;      
      errno = EEXIST ; 
   }
   else
   {
      *len_val = strlen ( ptr ) ; 
      if ( *len_val > 0 ) 
      {
         c_getenv_TmpBuff = (char *) malloc ( sizeof(char) * (*len_val + 1) );
         strncpy ( c_getenv_TmpBuff, ptr, *len_val+1 ) ;
      }
   }
}

// then, copy the result in the buff c_getenv_TmpBuff to *val

void  c_getenv_post_ ( size_t *len_val, char *val )
{
   if ( *len_val > 0 ) 
   {
      strncpy ( val, c_getenv_TmpBuff, *len_val ) ;
      free ( c_getenv_TmpBuff );
   }
}






/*

We can call c_getenv_ with val as an array of character(len=1) 

//////////////////////////////////////////////////////////////////////
//
// Dimensioning to work with array of character.
//
//    char val [*len_val] = character val(len_val)
//

void  c_getenv_array_ ( 
   const char *nam, char val [], size_t *len_val, size_t *lentrim_val 
)
{
   char *ptr = getenv ( nam ) ;

// printf ( "nam = %s   len = %d\n", nam, (int) strlen(nam) );
// printf ( "ptr = %s\n", ptr );

   if ( ptr == NULL )
   {
// 
//    The provided name does not exists as an env-variable. Exit and Report.
//
      *lentrim_val = 0 ;      
      errno = EEXIST ; 
   }
   else
   {
      size_t dump = strlen ( ptr ) ; 
      size_t dumv = *len_val - 1 ;
 
      strncpy ( val, ptr, dumv ) ;
//
//    Perfoming 
//       *lentrim_val = ( dump > dumv )? dumv : dump  ;  
//
      if ( dump > dumv )
      {
//
//       The room of VAL is so small that it cannot store PTR. Increase it.
//       Report: 
//       errno = ERANGE
//
         *lentrim_val = dumv ;
         errno = ERANGE ; 
      }
      else
      {
//
//       Normal exit. 
//       Report: 
//       errno = 0
//
         *lentrim_val = dump ; 
         errno = 0 ;
      }

//    printf ( "val = %s\n\n", val );
   }
}

*/
