////////////////////////////////////////////////////////////////////////////////
/*
   GetRelativeFilename(), by Rob Fisher.
   rfisher@iee.org
   http://come.to/robfisher

   Modified by Tran Quoc Viet, viet204@gmail.com
*/
////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>

#include "i_utils.h"

#define  MAX_FILENAME_LEN  MAXLEN_FILENAME
#define  MAX_PATHNAME_LEN  MAXLEN_PATHNAME

/*
   The number of characters at the start of an absolute filename.  
   e.g. in DOS, absolute filenames start with 
      "X:\" 
   so this value should be 
      3
   In UNIX they start with 
      "\" 
   so this value should be 1.
   #define ABSOLUTE_NAME_START 3
*/
#define ABSOLUTE_NAME_START 1

/*
   set this to '\\' for DOS or '/' for UNIX
   #define SLASH '\\'
*/
#define OS_SLASH  SLASH

///////////////////////////////////////////////////////////////////////////////
/*
   Given the absolute current directory and an absolute file name, 
   returns a relative file name. For example, if the current directory is 
      C:\foo\bar 
   and the filename 
      C:\foo\whee\text.txt 
   is given, GetRelativeFilename will return 
      ..\whee\text.txt


   Should check with care!

   For the symlink 
      ~/tool ---> ~/Dropbox/viet/tool

   FAILED TEST CASEs:  (I fixed!)

   1. Assume we are 
      pwd =   ~/tool/mylib/src-of-lib/posix90/src/zzz
          --> ~/Dropbox/viet/tool/mylib/src-of-lib/posix90/src/zzz
   Input:
      ~/tool 
   Result: 
      ../../../../../tool
   WRONG!

   2. Move to 
         ~/tmp/trash 
      where 
         ~/tmp/trash -> /home/tqviet/tool/mylib/test-at-here/trash
   Input:
      ~/tool 
   Result: 
      ../../../tool
   WRONG!


   GOOD TEST CASEs: 

   1. However, when we move to another symlink, say 
         ~/tmp/tt2 
      where 
         ~/tmp/tt2 --> ~/apps/tt2
   Input:
      ~/tool 
   Result: 
      ../../Dropbox/viet/tool
   It's correct!

   3. Particularly, move to symplink 
         ~/tmp/Public 
      where 
         ~/tmp/Public --> ~/Dropbox/Public
   Input:
      ~/tool 
   Result: 
      ../viet/tool
   It's correct!

   IF THE pwd IS NOT A symlink NOR INCLUDED IN A symlink, IT WORKS!
*/
// this version has a minor bug! I fixed with the new one as its next.
char* GetRelativeFilenameBAK01 ( char *currentDirectory, char *absoluteFilename )
{
/*
   declarations - put here so this should work in a C compiler
   NOTE: 
      In Debian/Linux, for variables to save size/length, the 'int' (4 bytes) 
      is replaced by 'size_t' kind (8 bytes), which is to ensure those values 
      are big enough.
*/
   static char relativeFilename [ MAX_FILENAME_LEN + 1 ] ;
   int      levels = 0 ;
   size_t   afMarker = 0 ; 
   size_t   rfMarker = 0 ;
   size_t   i = 0 ;
   size_t   cdLen = strlen(currentDirectory) ;
   size_t   afLen = strlen(absoluteFilename) ;

/* make sure the names are not too long or too short
*/
   if (  cdLen > MAX_FILENAME_LEN      || 
         cdLen < ABSOLUTE_NAME_START+1 || 
         afLen > MAX_FILENAME_LEN      || 
         afLen < ABSOLUTE_NAME_START+1  )
   {
      return NULL;
   }

/* Handle DOS names that are on different drives:
*/
   if ( currentDirectory[0] != absoluteFilename[0] )
   {
/*    not on the same drive, so only absolute filename will do
*/
      strcpy ( relativeFilename, absoluteFilename );
      return relativeFilename;
   }

/* they are on the same drive, find out how much of the current directory
   is in the absolute filename
*/
   i = ABSOLUTE_NAME_START ;
   while (  i < afLen   && 
            i < cdLen   && 
            currentDirectory[i] == absoluteFilename[i] )
   {
      i++;
   }

   if (  i == cdLen && 
         (  absoluteFilename[i] == OS_SLASH || 
            absoluteFilename[i-1] == OS_SLASH 
         )  )
   {
/*
      the whole current directory name is in the file name,
      so we just trim off the current directory name to get the
      current file name.
*/
      if ( absoluteFilename[i] == OS_SLASH )
      {
/*       a directory name might have a trailing slash but a relative
         file name should not have a leading one...
*/
         i++;
      }
      strcpy ( relativeFilename, &absoluteFilename[i] );
      return relativeFilename ;
   }
/*
   The file is not in a child directory of the current directory, so we
   need to step back the appropriate number of parent directories by
   using "..\"s.  First find out how many levels deeper we are than the
   common directory
*/
   afMarker = i;
   levels = 1;
/*
   count the number of directory levels we have to go up to get to the
   common directory
*/
   while ( i < cdLen )
   {
      i++;
      if ( currentDirectory[i] == OS_SLASH )
      {
/*       make sure it's not a trailing slash
*/
         i++;
         if ( currentDirectory[i] != '\0' )
         {
            levels++;
         }
      }
   }

/* move the absolute filename marker back to the start of the directory name
   that it has stopped in.
*/
   while ( afMarker > 0 && absoluteFilename[afMarker-1] != OS_SLASH )
   {
      afMarker--;
   }

/* check that the result will not be too long
*/
   if(levels * 3 + afLen - afMarker > MAX_FILENAME_LEN)
   {
      return NULL;
   }

/* add the appropriate number of "..\"s.
*/
   rfMarker = 0 ;
   for ( i = 0; i < levels; i++ )
   {
      relativeFilename[rfMarker++] = '.';
      relativeFilename[rfMarker++] = '.';
      relativeFilename[rfMarker++] = OS_SLASH;
   }

/* copy the rest of the filename into the result string
*/
   strcpy ( &relativeFilename[rfMarker], &absoluteFilename[afMarker] );
   return relativeFilename ;
}

///////////////////////////////////////////////////////////////////////////////

char* GetRelativeFilename ( char *currentDirectory, char *absoluteFilename )
{
/*
   declarations - put here so this should work in a C compiler
   NOTE: 
      In Debian/Linux, for variables to save size/length, the 'int' (4 bytes) 
      is replaced by 'size_t' kind (8 bytes), which is to ensure those values 
      are big enough.
*/
   static char relativeFilename [ MAX_FILENAME_LEN + 1 ] ;
   int      levels = 0 ;
   size_t   afMarker = 0 ; 
   size_t   rfMarker = 0 ;
   size_t   i = 0 ;
   size_t   cdLen = strlen ( currentDirectory ) ;
   size_t   afLen = strlen ( absoluteFilename ) ;

/* make sure the names are not too long or too short
*/
   if (  cdLen > MAX_FILENAME_LEN      || 
         cdLen < ABSOLUTE_NAME_START+1 || 
         afLen > MAX_FILENAME_LEN      || 
         afLen < ABSOLUTE_NAME_START+1  )
   {
      return NULL;
   }

/* Handle DOS names that are on different drives:
*/
   if ( currentDirectory[0] != absoluteFilename[0] )
   {
/*    not on the same drive, so only absolute filename will do
*/
      strcpy ( relativeFilename, absoluteFilename );
      return relativeFilename;
   }

// For the case:  
// cd = /home/tqviet/Dropbox/viet/tool/mylib/src-of-lib/posix90/src/zzz
// ab = /home/tqviet/Dropbox/viet/tool/mylib

/* they are on the same drive, find out how much of the current directory
   is in the absolute filename
*/
   i = ABSOLUTE_NAME_START ;
   while (  i < afLen   && 
            i < cdLen   && 
            currentDirectory[i] == absoluteFilename[i] )
   {
      i++;
   }
// ==>   i = afLen

   if (  i == cdLen && 
         (  absoluteFilename[i] == OS_SLASH || 
            absoluteFilename[i-1] == OS_SLASH 
         )  )
   {
/*
      the whole current directory name is in the file name,
      so we just trim off the current directory name to get the
      current file name.
*/
      if ( absoluteFilename[i] == OS_SLASH )
      {
/*       a directory name might have a trailing slash but a relative
         file name should not have a leading one...
*/
         i++;
      }
      strcpy ( relativeFilename, &absoluteFilename[i] );
      return relativeFilename ;
   }
/*
   The file is not in a child directory of the current directory, so we
   need to step back the appropriate number of parent directories by
   using "..\"s.  First find out how many levels deeper we are than the
   common directory
*/
   afMarker = i;
   levels = 1;

// cd = /home/tqviet/Dropbox/viet/tool/mylib/src-of-lib/posix90/src/zzz
// ab = /home/tqviet/Dropbox/viet/tool/mylib
// ==>   i = afLen = afMarker
// Fix the bug:
   if ( afMarker == afLen ) levels++ ;  

/*
   count the number of directory levels we have to go up to get to the
   common directory
*/
   while ( i < cdLen )
   {
      i++;
      if ( currentDirectory[i] == OS_SLASH )
      {
/*       make sure it's not a trailing slash
*/
         i++;
         if ( currentDirectory[i] != '\0' )
         {
            levels++;
         }
      }
   }

/* move the absolute filename marker back to the start of the directory name
   that it has stopped in.
*/
   while ( afMarker > 0 && absoluteFilename[afMarker-1] != OS_SLASH )
   {
      afMarker--;
   }

/* check that the result will not be too long
*/
   if ( levels * 3 + afLen - afMarker > MAX_FILENAME_LEN )
   {
      return NULL;
   }

/* add the appropriate number of "..\"s.
*/
   rfMarker = 0 ;
   for ( i = 0; i < levels; i++ )
   {
      relativeFilename[rfMarker++] = '.';
      relativeFilename[rfMarker++] = '.';
      relativeFilename[rfMarker++] = OS_SLASH;
   }

/* copy the rest of the filename into the result string
*/
   strcpy ( &relativeFilename[rfMarker], &absoluteFilename[afMarker] );
   return relativeFilename ;
}

////////////////////////////////////////////////////////////////////////////////


/*
   the buffer rpath should have len_rpath to be large enough, e.g. 
      len_path = PATH_MAX 

   Usage:
   c_relpath_ ( '~/x1/x2/x3/txt', rpath, len_rpath, lentrim_rpath ) 
*/

void c_relpath_ ( 
   const char *path, char *rpath, size_t *len_rpath, size_t *lentrim_rpath ) 
{
//
// if path = '/', we should exit with warnings, since we can not get
// the parent of '/', thus, cannot use '..'.
// Let's do this before this scope.
//
   size_t   lmax_rpath = *len_rpath ; 
   size_t   lcut_rpath = 0 ; 
/* 
   Obtaining the current directory 
*/
   char  thepwd [ MAX_PATHNAME_LEN + 1 ] ;

   errno = 0 ; 

   char *pt1 = getcwd ( thepwd, MAX_PATHNAME_LEN ) ;

   if ( pt1 == NULL )
   {
      printf (
         "ERROR: something was wrong as *pt1 = getcwd (...) in \n"
         "\t c_relpath.c --> void c_relpath_, errno = %d\n", errno ) ; 
      lcut_rpath = 0 ;      
      return ; 
   }

/* Obtaining the absolute path of path 
*/
   char abspath [ MAX_PATHNAME_LEN + 1 ] ;

   errno = 0 ; 

   char *pt2 = realpath ( path, &abspath[0] ) ; 

   if ( pt2 == NULL )
   {
      printf (
         "ERROR: something was wrong as *pt2 = realpath (...) in \n"
         "\t c_relpath.c --> void c_relpath_, errno = %d \n", errno ) ; 
      lcut_rpath = 0 ;      
      return ; 
   }
   else 
   {
      errno = 0 ; 

      char *pt3 = GetRelativeFilename ( &thepwd[0], &abspath[0] ) ;

      if ( pt3 == NULL )
      {
         printf (
            "ERROR: something was wrong as *pt3=GetRelativeFilename(...) in \n"
            "\t c_relpath.c --> void c_relpath_, errno = %d \n", errno ) ; 
         lcut_rpath = 0 ;      
         return ; 
      }
      else
      {
         lcut_rpath = strlen ( pt3 ) ;
         if ( lcut_rpath > lmax_rpath ) 
         {
            lcut_rpath = lmax_rpath ;
            errno = ERANGE ; 
            printf (
               "WARNINGR: c_relpath.c --> void c_relpath_ \n"
               "\t Increase length of rpath! errno = %d \n", errno ) ; 
         } 
         strncpy ( rpath, pt3, lcut_rpath ) ; 
      }
   }
   *lentrim_rpath = lcut_rpath ;  
}

////////////////////////////////////////////////////////////////////////////////
//
// to work with allocatable array of character. Later on, we use this for 
// str as type(string).
//

char * c_relpath_TmpBuff ;

// To obtain the length of string, i.e. len_val (not counting NULL) 

void  c_relpath_prep_ ( const char *path, size_t *len_val )
{
   size_t   lmb = MAXLEN_PATHNAME ; 
   size_t   ltb = -1 ; 
   char     buff [ MAXLEN_PATHNAME ] = "" ;

   c_relpath_ ( path, &buff[0], &lmb, &ltb ) ; 

   if ( ltb < 1 )
   {
      *len_val = 0 ;      
   }
   else
   {
      *len_val = ltb ; 
      c_relpath_TmpBuff = (char *) malloc ( sizeof(char) * (*len_val + 1) );
      strncpy ( c_relpath_TmpBuff, &buff[0], *len_val + 1 ) ;
   }

}

// then, copy the result in the buff c_relpath_TmpBuff to *val

void  c_relpath_post_ ( size_t *len_val, char *val )
{
   if ( *len_val > 0 ) 
   {
      strncpy ( val, c_relpath_TmpBuff, *len_val ) ;
      free ( c_relpath_TmpBuff );
   }
}





////////////////////////////////////////////////////////////////////////////////
