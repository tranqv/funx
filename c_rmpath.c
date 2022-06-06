////////////////////////////////////////////////////////////////////////////////

/*
   SOURCE: 
   https://stackoverflow.com/questions/2256945/\
removing-a-non-empty-directory-programmatically-in-c-or-c/2256974
*/

#include <stdlib.h>
#include <dirent.h> 
#include <string.h> 
#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>

//

int   c_rmpath__ ( const char *path )
{
   DIR *d = opendir ( path );

   printf ( "Open %s\n", path );

   size_t len_path = strlen ( path );
   int r = -1;

   if ( d )
   {
      struct dirent *p;

      r = 0;

      while ( !r && ( p = readdir(d) ) )
      {
         int r2 = -1;
         char *buf ;
         size_t len = 0;
/*
         Skip the names "." and ".." since we don't want to recurse on them. 
*/
         if ( !strcmp ( p->d_name, "." ) || !strcmp ( p->d_name, ".." ) )
         {
            continue;
         }

         len = len_path + strlen ( p->d_name ) + 2;
 
         buf = malloc ( len ) ;

         if ( buf )
         {
            struct stat statbuf ;

            snprintf ( buf, len, "%s/%s", path, p->d_name ) ;

            if ( !stat ( buf, &statbuf ) )
            {
               if ( S_ISDIR( statbuf.st_mode ) )
               {
                  printf ( ">>>> rmpath  %s ...\n", buf );
                  r2 = c_rmpath__ ( buf ) ;
               }
               else
               {
                  printf ( ">>>> unlink  %s\n", buf );
                  r2 = unlink ( buf );
               }
            }

            free ( buf );
         }
         r = r2 ;
      }
      closedir ( d ) ;
   }
   
   if ( !r )
   {
      printf ( "rmdir   %s\n", path );
      r = rmdir ( path );
   }
   return r;
}

//

#include <errno.h>
#include <i_utils.h>

//

void  c_rmpath_ ( const char *path )
{
   if ( c_utils_lenIsNotOK__(path) ) 
   {
      errno = ENAMETOOLONG ;
      return ;
   }
   c_rmpath__ ( path ) ; 
}

