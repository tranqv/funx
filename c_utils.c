////////////////////////////////////////////////////////////////////////////////
/*
   i_*.h 

   Defining some useful subroutines which will be called from other 
   subroutines in C source codes, i.e. c_*.c. While *.inc are for 
   Fortran source codes, i.e. f_*.f90 
*/

//

#include <string.h>
#include <errno.h>
#include <stdio.h>
#include <sys/stat.h>

#include <dirent.h>

#include "i_utils.h"


//

int   c_utils_lenIsOK__ ( const char *path )
{
   return ( strlen(path) <= MAXLEN_PATHNAME ) ; 
}

int   c_utils_lenIsNotOK__ ( const char *path )
{
   return ( strlen(path) > MAXLEN_PATHNAME ) ; 
}


/* INFO:

int   c_utils_buffer_NotOK__ ( const char *path, char *buff ) 

   Copying path to buff, return 
      0  (false)  if succeed making buffer 
      1  (true)   if failed to make buffer 
   Why? We want to do this thing later on, 
      if ( c_utils_buffer_NotOK__(path,buff) ) 
      {  EXIT  }
      else
      {  Go further ... }
*/

int   c_utils_buffer_NotOK__ ( const char *path, char *buff ) 
{
   extern int errno ; 
   int   istat = 0 ; 
/* 
   Make sure that we have defined the buff outside this scope, as follows:
	char buff [ MAXLEN_PATHNAME ] ; 
*/
   errno = 0 ;

   size_t len_path = strlen ( path );

   if ( len_path > MAXLEN_PATHNAME ) 
   {
      istat = 1 ; 
      errno = ENAMETOOLONG ;
      printf ( 
      ">>> ERROR: your path is too long, "
      "len_path=%ld > len_buff=%d, errno=%d\n",
      len_path, MAXLEN_PATHNAME, errno ) ;
   }
   else    
   {
//    strncpy ( buff, path, len_path ) ;
      strcpy ( buff, path ) ;
	   if ( errno != 0 ) 
   	{
         istat = 1 ; 
	      printf ( 
     	   ">>> WARNING: something was wrong with strcpy(buff,path), errno=%d\n", 
         errno ) ;
   	}
   }
   return istat ; 
}




/*
   IMPORTANT NOTE: new implementation to external routines which will
   be called from Fortran code. 
   1. All integers are in decimal presentation, by default. 
   2. So, do not use mode_t for arguments. Instead, use int and convert 
      from int to mode_t, and reversely, on demand.  
   3. We only care about VALUE not decimal nor octal presentation. For 
      working with different presentations of number we should convert 
      to obtain the exact value that we need. Care. 

   Example 1: 
   ---------
      For inum = 0765,

      inum is integer with size of mode_t (i.e. 4 bytes), and we treat

         inum = 7x10^2 + 6x10^1 + 5

      by the default meaning. If we want it to be in octal presentation  
      i.e., 

         inum = 7x8^2 + 6x8^1 + 5 ?

      we have to convert. In this case, its real value is changed. Make 
      doing converting before any calculation. 
      Use
 
         c_utils_dec2oct ( inum, idec )

      then inum becomes

         idec = 501 = 7x8^2 + 6x8^1 + 5
*/ 


/*
   To convert a mode_t number with decimal value to string of octal value.
   The string str must have at least 10 bytes (len >= 10).
   In Fortran 
      call c_utils_decmode_to_octvalu ( idec, ioct )
   where 
      idec: integer( kind = ck_mode_t ) 
      ioct: integer( kind = ck_mode_t ) 
      ck_mode_t = 8
*/

/*
   Version 01: works

void c_utils_decmode_to_octvalu_ ( mode_t *idec, mode_t *ioct ) 
{
   char     buf[11] = "??????????";
   sprintf ( buf, "%o", (mode_t) *idec  );
   sscanf  ( buf, "%u", ioct );
}
*/

/*
   Convert a number with decimal value to octal value
   Version 02: works 
   Modified from source:
      https://www.tutorialgateway.org/c-program-to-convert-decimal-to-octal-number/

   Given idec = ABC, by default, it is understood as  
      idec = Ax10^2 + Bx10^1 + C 
   the following subroutine is to perform 
   1. consider idec in the form
      A?x10^2 + Bx10^1 + C 
   2. convert idec to the form
      ioct = ?x8^? + ?x8^? + ?x8^? ...

   For n=765. Of course we alway treat n as in decimal presentaion.  
   Now If we want to translate n to octal value, then it should be 1375
   because 
      1x8^3 + 3x8^2 + 7x8^1 + 5 = 765

   765   -->   1375 
*/

void c_utils_dec2oct_ ( int *iinp, int *iout ) 
{
   int   decval = *iinp ;
   int   octval = 0 ;
   int   i = 1;
   int   remainder ;

   while ( decval != 0 )
   {
      remainder = decval % 8 ;
      decval = decval / 8 ;
      octval = octval + (remainder*i) ;
      i = i * 10 ;
   }
   *iout = octval ;
}



/*
   Given ioct = ABC, by default, it is understood as 
      ioct = Ax10^2 + Bx10^1 + C 
   the following subroutine is to perform
   1. consider ioct in the form
      Ax8^2 + Bx8^1 + C 
   2. convert ioct to the form
      idec = ?x10^? + ?x10^? + ?x10^? ...
*/
void c_utils_oct2dec_ ( int *ioct, int *idec ) 
{
   int   octval = *ioct ;
   int   decval = 0 ;
   int   i = 1;
   int   remainder ;

   while ( octval != 0 )
   {
      remainder = octval % 10 ;
      octval = octval / 10 ;
      decval = decval + (remainder*i) ;
      i = i * 8 ;
   }
   *idec = decval ;
}


/*
   To convert a string of permission to octal value.

   The string str must have length at least 10, i.e. 10 bytes.

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
void c_utils_per2dec_ ( const char *str, int *idec ) 
{
   char     chars[10] = "?????????" ;
   mode_t   octval ; 

   strncpy ( chars, str, 9 ) ;

// printf ( "str = %s --> chars = %s\n", str, chars );  

   octval = 0 ; 
/*
      S_IRUSR (1 << 8) | S_IWUSR (1 << 7) | S_IXUSR (1 << 6) | 
      S_IROTH (1 << 5) | S_IWOTH (1 << 4) | S_IXOTH (1 << 3) | 
      S_IRGRP (1 << 2) | S_IWGRP (1 << 1) | S_IXGRP (1 << 0) 
*/
   if ( chars[0] == 'r' ) octval = (octval|S_IRUSR) ;
   if ( chars[1] == 'w' ) octval = (octval|S_IWUSR) ;
   if ( chars[2] == 'x' ) octval = (octval|S_IXUSR) ;
 
   if ( chars[3] == 'r' ) octval = (octval|S_IRGRP) ;
   if ( chars[4] == 'w' ) octval = (octval|S_IWGRP) ;
   if ( chars[5] == 'x' ) octval = (octval|S_IXGRP) ;
  
   if ( chars[6] == 'r' ) octval = (octval|S_IROTH) ;
   if ( chars[7] == 'w' ) octval = (octval|S_IWOTH) ;
   if ( chars[8] == 'x' ) octval = (octval|S_IXOTH) ;

   *idec = (int) octval ; 
}

/*
   To convert a mode_t number with octal value to string.
   Ths is the inverse of strperm_to_octvalu. 
   The string str must have at least 10 bytes.
*/

void c_utils_dec2per_ ( int *idec, char *str ) 
{
   const char  chars[] = "rwxrwxrwx";
   mode_t      octval = (mode_t) *idec; 
/*
      S_IRUSR (1 << 8) | S_IWUSR (1 << 7) | S_IXUSR (1 << 6) | 
      S_IROTH (1 << 5) | S_IWOTH (1 << 4) | S_IXOTH (1 << 3) | 
      S_IRGRP (1 << 2) | S_IWGRP (1 << 1) | S_IXGRP (1 << 0) 
*/
   for ( size_t i = 0; i < 9; i++ ) 
   {
      str[i] = ( octval & (1 << (8-i)) ) ? chars[i] : '-';
   }
   str[9] = '\0';
}


void c_utils_per2oct_ ( const char *str, int *ioct ) 
{
   int   idec ;
   c_utils_per2dec_ ( str, &idec ) ; 
   c_utils_dec2oct_ ( &idec, ioct ) ; 
}

void c_utils_oct2per_ ( int *ioct, char *str ) 
{
   int   idec ; 
   c_utils_oct2dec_ ( ioct, &idec ) ;
   c_utils_dec2per_ ( &idec, str )  ;
}

//

/*
   FUP:  Fully Unix Permission
!
!     str = 'drwxrwxrwx.UGS'
!            123456789|||||
!                    10||||
!                     11|||
!                      12||
!                       13|
!                        14
!     str(1:1)
!        -  regular file 
!        l  symbolic link 
!        d  directory 
!        b  block device 
!        c  character device 
!        p  FIFO special file  
!        s  Socket file  
!     str(12:12)
!        U  set-user-ID on execute bit
!        -  not set 
!     str(13:13)
!        G  set-group-ID on execute bit
!        -  not set 
!     str(14:14)
!        S  set sticky bit
!        -  not set 

*/

void c_utils_dec2fup_ ( int *imode, char *perm )
{
   static char buff[15] = "??????????.???" ;
   char ftype = '?';

   mode_t mode = (mode_t) *imode;

   if       ( S_ISREG(mode) )    // regular file 
   {
      ftype = '-';
   }
   else if  ( S_ISLNK(mode) )    // symbolic link 
   {
      ftype = 'l';
   }
   else if  ( S_ISDIR(mode) )    // directory
   {
      ftype = 'd';
   }
   else if  ( S_ISBLK(mode) )    // block device 
   {
      ftype = 'b';
   }
   else if  ( S_ISCHR(mode) )    // character device 
   {
      ftype = 'c';
   }
   else if  ( S_ISFIFO(mode) )   // FIFO special file
   {
      ftype = 'p';
   }
   else if  ( S_ISSOCK(mode) )   // Socket file 
   {
      ftype = 's';
   }

/* Not good in practice. We should switch the cases.  
   if ( S_ISREG(mode) )    ftype = '-' ;
   if ( S_ISLNK(mode) )    ftype = 'l' ;
// if ( ( mode & S_IFMT ) == S_IFLNK )    ftype = 'l' ; //equiv
   if ( S_ISDIR(mode) )    ftype = 'd' ;
   if ( S_ISBLK(mode) )    ftype = 'b' ;
   if ( S_ISCHR(mode) )    ftype = 'c' ;
   if ( S_ISFIFO(mode) )   ftype = 'p' ;
   if ( S_ISSOCK(mode) )   ftype = 's' ;
*/

   sprintf (
      buff, "%c%c%c%c%c%c%c%c%c%c%c%c%c%c",
      ftype,
      mode &  S_IRUSR ? 'r' : '-',
      mode &  S_IWUSR ? 'w' : '-',
      mode &  S_IXUSR ? 'x' : '-',
      mode &  S_IRGRP ? 'r' : '-',
      mode &  S_IWGRP ? 'w' : '-',
      mode &  S_IXGRP ? 'x' : '-',
      mode &  S_IROTH ? 'r' : '-',
      mode &  S_IWOTH ? 'w' : '-',
      mode &  S_IXOTH ? 'x' : '-',
      '.',
      mode &  S_ISUID ? 'U' : '-',
      mode &  S_ISGID ? 'G' : '-',
      mode &  S_ISVTX ? 'S' : '-'
   );

   strncpy ( perm, buff, 14 ) ;
}

//

void c_utils_fup2dec_ ( const char *perm, int *imode )
{
   static char chars[15] = "??????????.???" ;
   mode_t   octval ; 

   strncpy ( chars, perm, 14 ) ;

// printf ( "str = %s --> chars = %s\n", str, chars );  

   octval = 0 ; 

   if       ( chars[0] == '-' )  
   {
      octval = ( octval | S_IFREG ) ;
   }
   else if  ( chars[0] == 'l' )  
   {
      octval = ( octval | S_IFLNK ) ;
   }
   else if  ( chars[0] == 'd' )  
   {
      octval = ( octval | S_IFDIR ) ;
   }
   else if  ( chars[0] == 'b' )  
   {
      octval = ( octval | S_IFBLK ) ;
   }
   else if  ( chars[0] == 'c' ) 
   {
      octval = ( octval | S_IFCHR ) ;
   }
   else if  ( chars[0] == 'p' )     
   {
      octval = ( octval | S_IFIFO ) ;
   }
   else if  ( chars[0] == 's' )     
   {
      octval = ( octval | S_IFSOCK ) ;
   }

   if ( chars[1] == 'r' ) octval = ( octval | S_IRUSR ) ;
   if ( chars[2] == 'w' ) octval = ( octval | S_IWUSR ) ;
   if ( chars[3] == 'x' ) octval = ( octval | S_IXUSR ) ;
 
   if ( chars[4] == 'r' ) octval = ( octval | S_IRGRP ) ;
   if ( chars[5] == 'w' ) octval = ( octval | S_IWGRP ) ;
   if ( chars[6] == 'x' ) octval = ( octval | S_IXGRP ) ;
  
   if ( chars[7] == 'r' ) octval = ( octval | S_IROTH ) ;
   if ( chars[8] == 'w' ) octval = ( octval | S_IWOTH ) ;
   if ( chars[9] == 'x' ) octval = ( octval | S_IXOTH ) ;

   if ( chars[11] == 'U' ) octval = ( octval | S_ISUID ) ;
   if ( chars[12] == 'G' ) octval = ( octval | S_ISGID ) ;
   if ( chars[13] == 'S' ) octval = ( octval | S_ISVTX ) ;

   *imode = (int) octval ; 
}


void c_utils_fup2oct_ ( const char *str, int *ioct ) 
{
   int   idec ;
   c_utils_fup2dec_ ( str, &idec ) ; 
   c_utils_dec2oct_ ( &idec, ioct ) ; 
}

void c_utils_oct2fup_ ( int *ioct, char *str ) 
{
   int   idec ; 
   c_utils_oct2dec_ ( ioct, &idec ) ;
   c_utils_dec2fup_ ( &idec, str )  ;
}


//
/*
   Scale size from bytes (Bs) to KB, MB, GB, TB, PB, EB
*/

void c_utils_scalebyte_ ( off_t *isize, float *rsize, char *unit ) 
{
   off_t    iinp = *isize ; 
   double   rout = iinp ; 
   char     str[7][2] = { "Bs", "KB", "MB", "GB", "TB", "PB", "EB" } ;  
   int      i ;   
   const double d = 1024; 

// printf ( "iinp = %li, INIT rout = %g \n", iinp, rout ) ;  
 
   for ( i = 0; i < 7 ; i++ )
   {
      if ( rout <= d ) break ; 
      rout = rout / d ;
   }

   *rsize = (float) rout ; 

   strncpy ( unit, str[i], 2 ) ;  
}

////////////////////////////////////////////////////////////////////////////////

#include <ctype.h>

// Lower case of string: c_utils_strlwr_ ( S ) ;
 
char* c_utils_strlwr_ ( char* s)
{
   for ( char* tmp = s; *tmp; ++tmp ) 
   {
      *tmp = tolower( (unsigned char) *tmp );
   }
   return s;
}


// Upper case of string: c_utils_strupr_ ( S ) ;

char* c_utils_strupr_ ( char* s)
{
   for ( char* tmp = s; *tmp; ++tmp ) 
   {
      *tmp = toupper( (unsigned char) *tmp );
   }
   return s;
}

/* 
   Source: 
   https://stackoverflow.com/questions/26327812/are-strupr-and-strlwr-in-string-h-part-of-the-ansi-standard
*/

////////////////////////////////////////////////////////////////////////////////

/*
   xref = reference (address number) of x, which is given in any kind.

      c_utils_vgetaddr_ ( &x, &xref )

   where x is of any kind.

   For now, 
      intptr_t == long = 8  (bytes)
   where
      intptr_t is defined by
         #include <stdint.h>
      /usr/include/stdint.h
   It implies we can use integer(8).
*/

#include <stdint.h>

void  c_utils_vgetaddr_ ( void *x, intptr_t *xref )
{
   *xref = (intptr_t) (void *) x ;
//
// printf ( "_vgetaddr_: input      = %p %ld \n", (void *) x , (intptr_t) (void *) x );
// printf ( "_vgetaddr_: input  ref = %p %ld \n",  &x        , (intptr_t) &x         );
// printf ( "_vgetaddr_: output     = %p %ld \n", (void *)*xref , (intptr_t) *xref   );
// printf ( "_vgetaddr_: output ref = %p %ld \n", (void *) xref , (intptr_t) xref    );
//
}


/*
   1. To obtain address (memory reference) of variable in any kind.
         *_vgetaddr_*
   2. To obtain information at an memory address, which is saved as a long integer.
         *_vgetinfo_*
      it means we will get value of data stored at the address.
   3. To obtain length of string at an memory address given as a 
      long integer, if the string is NULL-terminated (* IMPORTANT).
         *_vgetleng_*
*/

void  c_utils_vgetinfo_int_ ( intptr_t *iref, int *val ) 
{
//
// Method 1: indirect way (but understandable method) 
//
// void * r ;
// r = (int *) (*iref) ; 
// int *tmp ; 
// tmp = r ;
// *val = *tmp ;
//
// Method 2: direct way
//
// int *tmp = (int *) (*iref) ;
// *val = *tmp ; 
//
// Method 3: more direct way
//
   *val = (* (int *) (*iref)) ;
//
// printf ( "_vgetinfo_: value_int_  = %d \n", (int) *val );
}


void  c_utils_vgetinfo_long_ ( intptr_t *iref, long *val ) 
{
// long *tmp = (long *) (*iref) ;
// *val = *tmp ;
//
   *val = (* (long *) (*iref) ) ;
}

void  c_utils_vgetinfo_float_ ( intptr_t *iref, float *val ) 
{
// float *tmp = (float *) (*iref) ;
// *val = *tmp ; 
   *val = (* (float *) (*iref) ) ;
}

void  c_utils_vgetinfo_double_ ( intptr_t *iref, double *val ) 
{
// double *tmp = (double *) (*iref) ;
// *val = *tmp ; 
   *val = (* (double *) (*iref) ) ;
}

/*
   NOTE: Dangerous routines if work with strings
*/

void  c_utils_vgetleng_char_ ( intptr_t *iref, size_t *len ) 
{
// const char *tmp = (char *) (*iref) ;
//
// C does not know where is TMP's ending if the string with the 
// reference *iref does not include NULL at its end. This is a 
// very dangerous situation. We may need to add NULL char to 
// mark the end of the string. Otherwise, *len is a wrong outcome.
//
// *len = strlen ( tmp ) ;
   *len = strlen ( (char *) (*iref) ) ;
}

void  c_utils_vgetinfo_char_ ( 
   intptr_t *iref, char *val, size_t *len_val, size_t *lentrim_val ) 
{
//
   const char *tmp = (char *) (*iref) ;
//
// C does not know where is TMP's ending if the string with the 
// reference *iref does not include NULL at it ends. This is a 
// very dangerous situation. We may need to add NULL char to 
// mark the end of the string. Or, input *lentrim_val with a
// proper value.
//
// strncpy ( val, tmp, *lentrim_val ) ;
// strncpy ( val, (char *) (*iref), *lentrim_val ) ;
//
   *lentrim_val = strlen( tmp ) ;
   if ( *lentrim_val > *len_val ) *lentrim_val = *len_val ;  
   strncpy ( val, tmp, *lentrim_val ) ;
}




/* 
// This is OK but I dont need it.
void  c_utils_vgetinfo_fptr_ ( intptr_t *iref, FILE *val ) 
{
   *val = (* (FILE *) (*iref) ) ;
}

// This gives ERROR!
// #include <dirent.h>:
void  c_utils_vgetinfo_dptr_ ( intptr_t *iref, DIR *val ) 
{
// *val = (* (DIR *) (*iref) ) ;
//
// ERROR:       
//    c_utils.c:667:4: error: dereferencing pointer to incomplete type 
//       ???DIR {aka struct __dirstream}???
//
//    *val = (* (DIR *) (*iref) ) ;
//    ^
//    ???? wtf ????
  
   void * r ;
   r = (DIR *) (*iref) ;
   DIR *tmp ; 
   tmp = r ;
   *val = *tmp ; 
//
// ERROR: again 
//    c_utils.c:681:4: error: dereferencing pointer to incomplete type 
//       ???DIR {aka struct __dirstream}???
//    *val = *tmp ;
//    ^
//    ??? 
}

*/






////////////////////////////////////////////////////////////////////////////////

/*

//

https://www.gnu.org/software/libc/manual/html_node/Permission-Bits.html

   14.9.5 The Mode Bits for Access Permission

   The file mode, stored in the st_mode field of the file attributes, contains two kinds of information: the file type code, and the access permission bits. This section discusses only the access permission bits, which control who can read or write the file. See Testing File Type, for information about the file type code.

   All of the symbols listed in this section are defined in the header file sys/stat.h.

   These symbolic constants are defined for the file mode bits that control access permission for the file:

S_IRUSR
S_IREAD
    Read permission bit for the owner of the file. On many systems this bit is 0400. S_IREAD is an obsolete synonym provided for BSD compatibility.

S_IWUSR
S_IWRITE
    Write permission bit for the owner of the file. Usually 0200. S_IWRITE is an obsolete synonym provided for BSD compatibility.

S_IXUSR
S_IEXEC
    Execute (for ordinary files) or search (for directories) permission bit for the owner of the file. Usually 0100. S_IEXEC is an obsolete synonym provided for BSD compatibility.

S_IRWXU
    This is equivalent to ???(S_IRUSR | S_IWUSR | S_IXUSR)???.

S_IRGRP
    Read permission bit for the group owner of the file. Usually 040.

S_IWGRP
    Write permission bit for the group owner of the file. Usually 020.

S_IXGRP
    Execute or search permission bit for the group owner of the file. Usually 010.

S_IRWXG
    This is equivalent to ???(S_IRGRP | S_IWGRP | S_IXGRP)???.

S_IROTH
    Read permission bit for other users. Usually 04.

S_IWOTH
    Write permission bit for other users. Usually 02.

S_IXOTH
    Execute or search permission bit for other users. Usually 01.

S_IRWXO
    This is equivalent to ???(S_IROTH | S_IWOTH | S_IXOTH)???.

S_ISUID
    This is the set-user-ID on execute bit, usually 04000. See How Change Persona.

S_ISGID
    This is the set-group-ID on execute bit, usually 02000. See How Change Persona.

S_ISVTX
    This is the sticky bit, usually 01000. 

//

https://www.computerhope.com/jargon/s/setuid.htm

   Setuid, which stands for set user ID on execution, is a special type of file permission in Unix and Unix-like operating systems such as Linux and BSD. It is a security tool that permits users to run certain programs with escalated privileges.

   When an executable file's setuid permission is set, users may execute that program with a level of access that matches the user who owns the file. For instance, when a user wants to change their password, they run the 
   passwd 
command. The 
   passwd 
program is owned by the root account and marked as setuid, so the user is temporarily granted root access for that very limited purpose.

//

https://www.thegeekstuff.com/2013/02/sticky-bit/

   A Sticky bit is a permission bit that is set on a file or a directory that lets only the owner of the file/directory or the root user to delete or rename the file. No other user is given privileges to delete the file created by some other user.

   Think of a scenario where you create a Linux directory that can be used by all the users of the Linux system for creating files. Users can create, delete or rename files according to their convenience in this directory. For all those who think that why would such a directory be created? There exists, for example, 
   /tmp 
directory in the Linux system that can be used by different Linux users to create temporary files.

   Now, what if an user accidentally or deliberately deletes (or rename) a file created by some other user in this directory?

   Well, to avoid these kind of issues, the concept of sticky bit is used.

*/
