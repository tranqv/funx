////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//

void  c_getc_ ( FILE **fp, int *c )
{
   *c = getc ( *fp );
}

//
//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//

#include <stdint.h>

void  c_getc_intref_ ( intptr_t *iptr, int *c )
{
//              Should we cast the types in every byte? Consider!
   *c = getc ( (FILE *) (*iptr) );
}














/*
   DEPRECATED.

   Or, consider this procedure:
  
   Use global variable for casting types only one time
   because casting types may cost time! 
   We use registry list of pointers.

   --> NO IT'S EXTREMELY FAST! I CHECKED.


//const int MAX_IPTRLIST = 50 ;
#define     MAX_IPTRLIST   50
FILE        *IPTRLIST_fgetc[MAX_IPTRLIST] = {NULL} ; 

// Make sure 0 <= *id <= 49

// pre-processing: do this only only one time for every stream
void  c_fgetc_intref_pre_ ( int *id, intptr_t *iptr )
{
   IPTRLIST_fgetc[*id] = (FILE *) (*iptr) ;    
}

// processing:
void  c_fgetc_intref_pro_ ( int *id, int *c )
{
   *c = fgetc ( IPTRLIST_fgetc[*id] );
}

// end-processing:
void  c_fgetc_intref_end_ ( int *id )
{
   IPTRLIST_fgetc[*id] = NULL ; 
}


*/





















