#include <sys/stat.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
   Learned from
      https://jameshfisher.com/2017/02/24/what-is-mode_t/
   Modifying to obtain some new thing.
*/

enum class 
{ 
   CLASS_OWNER, CLASS_GROUP, CLASS_OTHER 
};

enum permission 
{ 
   PERMISSION_READ, PERMISSION_WRITE, PERMISSION_EXECUTE 
};

const mode_t EMPTY_MODE = 0;

mode_t perm (enum class c, enum permission p) 
{ 
   return 1 << ((3-p) + (2-c)*3); 
}

bool mode_contains (mode_t mode, enum class c, enum permission p) 
{ 
   return mode & perm(c, p); 
}

mode_t mode_add (mode_t mode, enum class c, enum permission p) 
{ 
   return mode | perm(c, p); 
}

mode_t mode_rm  (mode_t mode, enum class c, enum permission p) 
{ 
   return mode & ~perm(c, p); 
}

/*
   To convert string to mode_t number with octal value.
   The string str must have at least 10 bytes
   Ex: 
      rwxrwxrwx --> 0777
      rwxr-x--x --> 0751
      rwxr-xr-x --> 0755
      rw-rw-rw- --> 0666
      rw-r-xr-x --> 0655
      ------rwx --> 0007
      ------rw- --> 0006
      ------r-x --> 0005
      ------r-- --> 0004
      -------wx --> 0003
      -------w- --> 0002
      --------x --> 0001
      --------- --> 0000
*/

void string_2_mode_t ( char * str, mode_t * imode ) 
{
   char chars[10] = "?????????" ;

   strncpy ( chars, str, 9 ) ;

   printf ( "str = %s --> chars = %s\n", str, chars );  

   *imode = 0 ; 
/*
      S_IRUSR (1 << 8) | S_IWUSR (1 << 7) | S_IXUSR (1 << 6) | 
      S_IROTH (1 << 5) | S_IWOTH (1 << 4) | S_IXOTH (1 << 3) | 
      S_IRGRP (1 << 2) | S_IWGRP (1 << 1) | S_IXGRP (1 << 0) 
*/
   if ( chars[0] == 'r' ) *imode = (*imode|S_IRUSR) ;
   if ( chars[1] == 'w' ) *imode = (*imode|S_IWUSR) ;
   if ( chars[2] == 'x' ) *imode = (*imode|S_IXUSR) ;
 
   if ( chars[3] == 'r' ) *imode = (*imode|S_IRGRP) ;
   if ( chars[4] == 'w' ) *imode = (*imode|S_IWGRP) ;
   if ( chars[5] == 'x' ) *imode = (*imode|S_IXGRP) ;
  
   if ( chars[6] == 'r' ) *imode = (*imode|S_IROTH) ;
   if ( chars[7] == 'w' ) *imode = (*imode|S_IWOTH) ;
   if ( chars[8] == 'x' ) *imode = (*imode|S_IXOTH) ;
   return ;
}

/*
   To convert a mode_t number with octal value to string.
   Ths is the inverse of string_2_mode_t. 
   The string str must have at least 10 bytes.
*/
void mode_t_2_string ( mode_t imode, char * str ) 
{
   const char chars[] = "rwxrwxrwx";
/*
      S_IRUSR (1 << 8) | S_IWUSR (1 << 7) | S_IXUSR (1 << 6) | 
      S_IROTH (1 << 5) | S_IWOTH (1 << 4) | S_IXOTH (1 << 3) | 
      S_IRGRP (1 << 2) | S_IWGRP (1 << 1) | S_IXGRP (1 << 0) 
*/
   for ( size_t i = 0; i < 9; i++ ) 
   {
      str[i] = ( imode & (1 << (8-i)) ) ? chars[i] : '-';
   }

   str[9] = '\0';
}




int main ( void ) 
{
   char buf[10];

   mode_t examples[] = 
   { 
      00, 01, 02, 03, 04, 05, 06, 07, 0666, 0777, 0700, 0100, 0755, 0751, 0655 
   } ;

   size_t num_examples = sizeof(examples) / sizeof(examples[0]) ;

   mode_t tt ; 

   for ( size_t i = 0; i < num_examples; i++ ) 
   {
      mode_t_2_string ( examples[i], &buf[0] );
      printf ( "%30s %04o --> %9s\n", "1) mode_t --> string:", examples[i], buf );

      string_2_mode_t ( &buf[0], &tt );
      printf ( "%30s %9s --> %04o\n", "2) string --> mode_t:", buf, tt );

   }
//
   mode_t m1 = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH ; 
   printf ( "%30s\t m1 = %04o \t %d\n", "u:rw-,g:r--,o:r--", m1, m1 );
//
   mode_t m2 = S_IRUSR | S_IWUSR | S_IXUSR | S_IROTH ; 
   printf ( "%30s\t m2 = %04o \t %d\n", "u:rwx,g:---,o:r--", m2, m2 );
//
   mode_t m3 = S_IRUSR | S_IWUSR | S_IXUSR | 
               S_IROTH | S_IWOTH | S_IXOTH | 
               S_IRGRP | S_IWGRP | S_IXGRP ; 
   printf ( "%30s\t m3 = %04o \t %d\n", "u:rwx,g:rwx,o:rwx", m3, m3 );

//
   const char coc[] = "0777" ;
   mode_t  *ioc = 0 ; 

   printf ( "coc = %s\n", coc );

   sscanf( coc, "%4o", ioc );

   printf ( "ico = %d \t %04o\n\n", ((unsigned int) *ioc), ((unsigned int) *ioc) );

//

   int      imode = 777 ; 
   mode_t  *ioctal = 0 ; 
   char     cbuf[9] ;

   sprintf ( cbuf, "%d", imode   );
   sscanf  ( cbuf, "%o", ioctal );

   printf ( "imode  = %d \t %o\n", imode, imode );
   printf ( "cbuf   = %s\n", cbuf  );
   printf ( "ioctal = %d \t %o\n", ((unsigned int) *ioctal), ((unsigned int) *ioctal)  );


   return 0;
}

