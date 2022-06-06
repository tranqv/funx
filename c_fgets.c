////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <string.h>

////////////////////////////////////////////////////////////////////////////////

/*
   In the codes below, the output 
      *lentrim_s  
   stands for the number of bytes which are read successfully.
   So, the offset should be advanced like this: 
      offset = offset +  *lentrim_s
*/

void  c_fgets_ ( FILE **fp, char *s, int *len_s, int *lentrim_s )
{
   char *ptr = fgets ( s, *len_s, *fp ) ;

   if ( ptr == NULL )  
   {
      *lentrim_s = 0;
   }
   else
   {
      *lentrim_s = (int) strlen ( s ) ; 
   }
}





////////////////////////////////////////////////////////////////////////////////

#include <stdint.h>

void  c_fgets_intref_ ( intptr_t *iptr, char *s, int *len_s, int *lentrim_s )
{
   char *ptr = fgets ( s, *len_s, (FILE *) (*iptr) ) ;

   if ( ptr == NULL )  
   {
      *lentrim_s = 0;
   }
   else
   {
      *lentrim_s = (int) strlen ( s ) ; 
   }
}


////////////////////////////////////////////////////////////////////////////////

/*
SOURCE: 
   https://pubs.opengroup.org/onlinepubs/9699919799/functions/fgets.html

EXAMPLES

    Reading Input

    The following example uses fgets() to read lines of input. It assumes that the file it is reading is a text file and that lines in this text file are no longer than 16384 (or {LINE_MAX} if it is less than 16384 on the implementation where it is running) bytes long. (Note that the standard utilities have no line length limit if sysconf(_SC_LINE_MAX) returns -1 without setting errno. This example assumes that sysconf(_SC_LINE_MAX) will not fail.)

    #include <limits.h>
    #include <stdio.h>
    #include <unistd.h>
    #define MYLIMIT 16384


    char *line;
    int line_max;
    if (LINE_MAX >= MYLIMIT) {
        // Use maximum line size of MYLIMIT. If LINE_MAX is
        // bigger than our limit, sysconf() cannot report a
        // smaller limit.
        line_max = MYLIMIT;
    } else {
        long limit = sysconf(_SC_LINE_MAX);
        line_max = (limit < 0 || limit > MYLIMIT) ? MYLIMIT : (int)limit;
    }


    // line_max + 1 leaves room for the null byte added by fgets().
    line = malloc(line_max + 1);
    if (line == NULL) {
        // out of space
        ...
        return error;
    }


    while (fgets(line, line_max + 1, fp) != NULL) {
        // Verify that a full line has been read ...
        // If not, report an error or prepare to treat the
        // next time through the loop as a read of a
        // continuation of the current line.
        ...
        // Process line ...
        ...
    }
    free(line);
    ...



*/
