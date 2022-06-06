#include <stdio.h>
#include <string.h>
#include <i_utils.h>

//#include <c_utils.c>

////// WRONG !!!!

int main () 
{
   FILE ** fp;
   char c[] = "this is tutorialspoint. Modified by Tran Quoc Viet.";

   char C[] = "this is tutorialspoint. modified by tran quoc viet.";

   c_utils_strupr_ ( C ) ; 
// c_utils_strlwr_ ( C ) ; 

   char *buffer ;    

   size_t   nr ; 

   printf ( "stream     = %s %s\n", c, "(Before)" );
   printf ( "len stream = %ld\n\n", strlen(c)  );

   /* Open file for both reading and writing */
// fp = fopen ( "x_fread_01.txt", "w+" );

// c_fopen_ ( fp, "x_fread_01.txt", "w+" );
   c_fopen_ ( fp, "x_fread_01.txt", "r+" );

   /* Write data to the file */
// fwrite ( c, strlen(c) + 1, 1, fp);
// fwrite ( c, strlen(c) + 1 , 1, fp);
// fwrite ( "\n", 2 , 1, fp);
// fwrite ( C, strlen(c) + 1 , 1, fp);

// fwrite ( c, strlen(c)  , 1, *fp);
// fwrite ( "\n", 1 , 1, *fp);
// fwrite ( C, strlen(c)  , 1, *fp);



   /* Seek to the beginning of the file */
// fseek ( *fp, 0, SEEK_SET );

   c_fseek_ ( fp, 0, SEEK_SET );


   /* Read and display data */

   printf ( "len buffer = %ld %s\n", strlen(buffer), "(Before)" );

// nr = fread ( buffer, strlen(c) + 1, 1, fp );
// nr = fread ( &buffer[0], strlen(c) + 1, 1, fp );
// nr = fread ( &buffer[0], strlen(c) + 1, 1, fp );
// nr = fread ( &buffer[0], strlen(c), 1, fp );

// nr = fread ( buffer, strlen(c)+1, 2, fp );
// nr = fread ( buffer, 2*strlen(c)+1, 2, fp ); // n=2*strlen(c)+1 is large enough 

// nr = fread ( buffer, 2*strlen(c)+1, 2, fp ); // n=2*strlen(c)+1 is large enough 
// nr = fread ( buffer, 10, 1 , fp ); // n=2*strlen(c)+1 is large enough 

// int n = (size_t) 2*strlen(c) + 1 ; 

   int n = 1000  ; 
   int m = c_fread_achars_ ( fp, buffer, &n ) ;

   printf ( "buffer     = %s\n", buffer );
   printf ( "len buffer = %ld %s\n", strlen(buffer), "(After)" );
   printf ( "m          = %ld\n\n", m  );

   printf ( "stream     = %s %s\n", c, "(After)" );
   printf ( "len stream = %ld\n\n", strlen(c)  );


// fclose ( *fp );
   c_fclose_ ( fp );
   
   return(0);
}
