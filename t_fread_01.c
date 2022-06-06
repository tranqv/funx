#include <stdio.h>
#include <string.h>

int main () 
{
   FILE *fp;
   char c[] = "this is tutorialspoint. Modified by Tran Quoc Viet.";

// char buffer[100];
   char buffer[10];  // still OK!


   /* Open file for both reading and writing */
   fp = fopen ( "x_fread_01.txt", "w+" );

   /* Write data to the file */
   fwrite ( c, strlen(c) + 1, 1, fp);

   /* Seek to the beginning of the file */
   fseek ( fp, 0, SEEK_SET );

   /* Read and display data */
   fread ( buffer, strlen(c) + 1, 1, fp );

   printf ( "%s\n", buffer );

   fclose ( fp );
   
   return(0);
}
