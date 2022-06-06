
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>

int main (void)
{
  
   char       *user ;
   char       *oldpasswd ;
   char       *newpasswd ;
   ssize_t    llen ;
   size_t     blen ;
   struct termios term ;
   tcflag_t   saveflag ;

   printf ( "User name (ten cua may la gi?): " );
   fflush ( stdout );

   blen = 0;
   llen = getline ( &user, &blen, stdin );

   user[llen-1] = 0;

   tcgetattr ( fileno (stdin), &term );

   saveflag = term.c_lflag;

   term.c_lflag &= ~ECHO ;

   tcsetattr ( fileno(stdin), TCSANOW, &term );

   printf ( "Old password (nhap mat khau cu. Can than nha may!): " );
   fflush ( stdout );

   blen = 0;
   llen = getline ( &oldpasswd, &blen, stdin );

   oldpasswd[llen-1] = 0;

   printf ( "\nNew password (chon mat khau moi): " );
   fflush ( stdout );

   blen = 0;
   llen = getline ( &newpasswd, &blen, stdin );

   newpasswd[llen-1] = 0;
   term.c_lflag = saveflag;

   tcsetattr ( fileno(stdin), TCSANOW, &term );

   free ( user );
   free ( oldpasswd );
   free ( newpasswd );

   return 0 ; 
}
