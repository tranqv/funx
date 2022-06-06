////////////////////////////////////////////////////////////////////////////////

#include <dirent.h>

void  c_rewinddir_ ( DIR **dirp )
{
   rewinddir ( *dirp ) ;
}

//

#include <stdint.h>

void  c_rewinddir_intref_ ( intptr_t *iptr )
{
   rewinddir ( (DIR *) (*iptr) ) ;
}

//
