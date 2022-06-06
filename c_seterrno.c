#include <errno.h>

void  c_seterrno_ ( int * errc )
{
    errno = *errc;
}
