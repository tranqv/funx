/*

https://stackoverflow.com/questions/2550774/what-is-size-t-in-c
https://en.wikipedia.org/wiki/C_data_types#stddef.h
   
   According to the 1999 ISO C standard (C99), size_t is an unsigned integer type of at least 16 bit (see sections 7.17 and 7.18.3).

   size_t is an unsigned data type defined by several C/C++ standards, e.g. the C99 ISO/IEC 9899 standard, that is defined in stddef.h.1 It can be further imported by inclusion of stdlib.h as this file internally sub includes stddef.h.

   This type is used to represent the size of an object. Library functions that take or return sizes expect them to be of type or have the return type of size_t. Further, the most frequently used compiler-based operator sizeof should evaluate to a constant value that is compatible with size_t.

As an implication, size_t is a type guaranteed to hold any array index.
 
*/


/*
   /usr/include/dirent.h
   +  DIR   
         This is the data type of directory stream objects.
         The actual structure is opaque to users.  
         typedef struct __dirstream DIR;
   +  opendir, readdir, closedir, rewinddir, seekdir, ... 


   /usr/include/time.h
   +  clock_t, time_t,


   /usr/include/x86_64-linux-gnu/sys/types.h
   +  pid_t, uid_t, gid_t, dev_t, mode_t, nlink_t,
      u_char, u_short, u_int, u_long, quad_t, u_quad_t, fsid_t,
      loff_t, ino_t,  

*/

//#include <stdio.h>

// one in three the following things defines size_t 

//#include <time.h>
//#include <sys/types.h>
//#include <sys/stat.h>

# include <stddef.h>

int main()
{
   int n = sizeof(size_t) ; 

// printf( "(int)  size_t = %d\n", (int) sizeof(size_t) );
// printf( "       size_t = %d\n",       sizeof(size_t) );

   

   return 0;
}


