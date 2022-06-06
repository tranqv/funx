#include <dirent.h>
#include <string.h>
#include <errno.h>

void  c_readdir_ ( 
   DIR **dirp, char *path, size_t *len_path, size_t *lentrim_path 
)
{
   struct dirent *ent;

   ent = readdir ( *dirp ) ;

   if ( ent ) 
   {
      size_t dum1 = *len_path - 1 ; 

      strncpy ( path, ent->d_name, dum1 ) ;

      size_t dum2 = strlen ( ent->d_name ) ; 

//    *lentrim_path = strlen ( ent->d_name );

      if ( dum2 > dum1 )
      {
/*
         The room of name is so small..
         Report: 
         errno = ERANGE
*/
         *lentrim_path = dum1 ;
         errno = ERANGE ; 
      }
      else
      {
/*
         Normal exit. 
         Report: 
         errno = 0
*/
         *lentrim_path = dum2 ; 
         errno = 0 ;
      }
   } 
   else 
   {
      *path = 0 ; 
      *lentrim_path = -1;
      errno = -1 ; 
   }
}


//
#include <stdint.h>

void  c_readdir_intref_ ( 
   intptr_t *iptr, char *path, size_t *len_path, size_t *lentrim_path 
)
{
   struct dirent *ent;

   ent = readdir ( (DIR *) (*iptr) ) ;

   if ( ent ) 
   {
      size_t dum1 = *len_path - 1 ; 

      strncpy ( path, ent->d_name, dum1 ) ;

      size_t dum2 = strlen ( ent->d_name ) ; 

//    *lentrim_path = strlen ( ent->d_name );

      if ( dum2 > dum1 )
      {
/*
         The room of name is so small..
         Report: 
         errno = ERANGE
*/
         *lentrim_path = dum1 ;
         errno = ERANGE ; 
      }
      else
      {
/*
         Normal exit. 
         Report: 
         errno = 0
*/
         *lentrim_path = dum2 ; 
         errno = 0 ;
      }
   } 
   else 
   {
      *path = 0 ; 
      *lentrim_path = -1;
      errno = -1 ; 
   }

}

