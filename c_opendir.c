#include <dirent.h>

void  c_opendir_ ( const char *dirname, DIR **dirptr )
{
   *dirptr = opendir ( dirname ) ;
}

//
#include <stdint.h>
#include <stdio.h>

void  c_opendir_intref_ ( const char *dirname, intptr_t *iptr )
{
   *iptr = (intptr_t) (DIR *) opendir ( dirname ) ;
// printf ( "*iptr = %ld  %p\n", *iptr, (void *) (*iptr) ) ;
}
