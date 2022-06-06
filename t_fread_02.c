#include <stdio.h>
#include <string.h>

int main () 
{
   FILE *fp;
   const char c[] = "this is tutorialspoint. Modified by Tran Quoc Viet.";

// char buffer[100];
// char buffer[10];     // still OK!
   char *buffer;        // still OK!

   size_t   nr ; 

   printf ( "stream     = %s %s\n", c, "(Before)" );
   printf ( "len stream = %ld\n\n", strlen(c)  );

   /* Open file for both reading and writing */
   fp = fopen ( "x_fread_01.txt", "w+" );

   /* Write data to the file */
   fwrite ( c, strlen(c) + 1, 1, fp);

   /* Seek to the beginning of the file */
   fseek ( fp, 0, SEEK_SET );

   /* Read and display data */

// printf ( "len buffer = %ld %s\n", strlen(&buffer[0]), "(Before)" );
   printf ( "len buffer = %ld %s\n", strlen(buffer), "(Before)" );

// nr = fread ( buffer, strlen(c) + 1, 1, fp );
// nr = fread ( &buffer[0], strlen(c) + 1, 1, fp );
   nr = fread ( &buffer[0], strlen(c) + 1, 1, fp );

// nr = fread ( &buffer[0], strlen(&buffer[0]) + 1, 1, fp );  ??? 


   printf ( "buffer     = %s\n", buffer );
   printf ( "len buffer = %ld %s\n", strlen(buffer), "(After)" );
   printf ( "nr         = %ld\n\n", nr  );

   printf ( "stream     = %s %s\n", c, "(After)" );
   printf ( "len stream = %ld\n\n", strlen(c)  );


   fclose ( fp );
   
   return(0);
}
