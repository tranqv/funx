////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>

//
//    Upon successful completion, c_fputc() shall give ISTAT 
//          the value it has written. 
//    Otherwise, it shall give 
//          EOF, 
//    the error indicator for the stream shall be set, and ERRNO shall be set 
//    to indicate the error.
//

void  c_fputc_ ( FILE **fp, int *c, int *istat )
{
   *istat = fputc ( *c, *fp );
}

//
//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//

#include <stdint.h>

void  c_fputc_intref_ ( intptr_t *iptr, int *c, int *istat )
{
   *istat = fputc ( *c, (FILE *) (*iptr) );
}







/*
   DEPRECATED.

   Or, consider this procedure:
  
   Use global variable for casting types only one time
   because casting types costs time! 
   We use registry list of pointers.

   --> NO IT'S EXTREMELY FAST! I CHECKED. FORGET ABOUT THIS IMPLEMENTATION.


//const int MAX_IPTRLIST = 50 ;
#define     MAX_IPTRLIST   50
FILE        *IPTRLIST_fputc[MAX_IPTRLIST] = {NULL} ; 

// Make sure 0 <= *id <= 49


// pre-processing: do this only only one time for every stream
void  c_fputc_intref_pre_ ( int *id, intptr_t *iptr )
{
   IPTRLIST_fputc[*id] = (FILE *) (*iptr) ;    
}

// processing:
void  c_fputc_intref_pro_ ( int *id, int *c, int *istat )
{
   *istat = fputc ( *c, IPTRLIST_fputc[*id] );
}

// end-processing:
void  c_fputc_intref_end_ ( int *id )
{
   IPTRLIST_fputc[*id] = NULL ; 
}

*/





//
