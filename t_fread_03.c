#include <stdio.h>
#include <string.h>
#include <i_utils.h>

//#include <c_utils.c>


int main () 
{
   FILE *fp;
   char c[] = "this is tutorialspoint. Modified by Tran Quoc Viet.";

// char *C  ;
// strcpy( C , c ) ;
// c_utils_strupr_ ( C ) ; 

   char C[] = "this is tutorialspoint. modified by tran quoc viet.";

   c_utils_strupr_ ( C ) ; 
// c_utils_strlwr_ ( C ) ; 


// char buffer[100];
// char buffer[10];     // still OK!
   char *buffer;        // still OK!

   size_t   nr ; 

   printf ( "stream     = %s %s\n", c, "(Before)" );
   printf ( "len stream = %ld\n\n", strlen(c)  );

   /* Open file for both reading and writing */
   fp = fopen ( "x_fread_01.txt", "w+" );

   /* Write data to the file */
// fwrite ( c, strlen(c) + 1, 1, fp);
// fwrite ( c, strlen(c) + 1 , 1, fp);
// fwrite ( "\n", 2 , 1, fp);
// fwrite ( C, strlen(c) + 1 , 1, fp);

   fwrite ( c, strlen(c)  , 1, fp);
   fwrite ( "\n", 1 , 1, fp);
   fwrite ( C, strlen(c)  , 1, fp);



   /* Seek to the beginning of the file */
   fseek ( fp, 0, SEEK_SET );

   /* Read and display data */

// printf ( "len buffer = %ld %s\n", strlen(&buffer[0]), "(Before)" );
   printf ( "len buffer = %ld %s\n", strlen(buffer), "(Before)" );

// nr = fread ( buffer, strlen(c) + 1, 1, fp );
// nr = fread ( &buffer[0], strlen(c) + 1, 1, fp );
// nr = fread ( &buffer[0], strlen(c) + 1, 1, fp );
// nr = fread ( &buffer[0], strlen(c), 1, fp );

// nr = fread ( buffer, strlen(c)+1, 2, fp );
// nr = fread ( buffer, 2*strlen(c)+1, 2, fp ); // n=2*strlen(c)+1 is large enough 

// nr = fread ( buffer, 10000, 1, fp ); // OK 
   nr = fread ( buffer, 150, 1, fp ); // Ok

   printf ( "buffer     = %s\n", buffer );
   printf ( "len buffer = %ld %s\n", strlen(buffer), "(After)" );
   printf ( "nr         = %ld\n\n", nr  );

   printf ( "stream     = %s %s\n", c, "(After)" );
   printf ( "len stream = %ld\n\n", strlen(c)  );


   fclose ( fp );
   
   return(0);
}
