////////////////////////////////////////////////////////////////////////////////

#include <dirent.h>

void  c_closedir_ ( DIR **dirp )
{
   closedir ( *dirp ) ;
}

//

#include <stdint.h>

void  c_closedir_intref_ ( intptr_t *iptr )
{
   closedir ( (DIR *) (*iptr) ) ;
}
