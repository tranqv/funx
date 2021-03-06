/*
   Defining some useful constants or parameters which will be used by other 
   subroutines in C source codes, i.e. c_*.c. While *.inc are for Fortran
   source codes, i.e. f_*.f90 
*/

#include <linux/limits.h> 
#define MAXLEN_FILENAME  NAME_MAX
#define MAXLEN_PATHNAME  PATH_MAX

#define SLASH '/'


/* 
   INTERFACE
 
   Since we want to use    
      #include <i_utils.h>
   in many c_*.c codes. Here the below subroutines are defined 
   in c_utils.c 
*/

int   c_utils_buffer_NotOK__ ( const char *, char * ) ;
int   c_utils_lenIsOK__ ( const char * ) ;
int   c_utils_lenIsNotOK__ ( const char * ) ;

void  c_utils_dec2oct_ ( int *, int * ) ;
void  c_utils_oct2dec_ ( int *, int * ) ; 

void  c_utils_per2dec_ ( const char *, int * ) ;
void  c_utils_dec2per_ ( int *, char * ) ;
void  c_utils_per2oct_ ( const char *, int * ) ;
void  c_utils_oct2per_ ( int *, char * )  ;

void  c_utils_fup2dec_ ( const char *, int * ) ;
void  c_utils_dec2fup_ ( int *, char * ) ;
void  c_utils_fup2oct_ ( const char *, int * ) ;
void  c_utils_oct2fup_ ( int *, char * )  ;

//
#include <sys/types.h>
void  c_utils_scalebyte_ ( off_t *, float *, char * ) ;

//

char* c_utils_strlwr_ ( char * ) ; 
char* c_utils_strupr_ ( char * ) ; 

//
#include <unistd.h>

void  c_realpath_ ( const char *, char *, size_t *, size_t * ) ;
void  c_abspath_ ( const char *, char *, size_t *, size_t * ) ;
void  c_relpath_ ( const char *, char *, size_t *, size_t * ) ;
void  c_readlink_ ( const char *, char *, size_t *, size_t * ) ;
void  c_access_ ( char *, int *, int * ) ;
void  c_chdir_ ( char * ) ; 
void  c_chmod_ ( const char *, int * ) ;
void  c_getcwd_ ( char *, size_t *, size_t * ) ;
void  c_getenv_ ( const char *, char *, size_t *, size_t * ) ;  
//void  c_getenv_array_ ( const char *, char [], size_t *, size_t *) ; 
void  c_geterrno_ ( int * ) ; 
void  c_link_ ( const char *, const char * ) ;
void  c_symlink_ ( const char *, const char * ) ; 
void  c_unlink_ ( const char * ) ;
void  c_mkdir_decf_ ( const char *, int * ) ;
void  c_mkdir_octf_ ( const char *, int * ) ;
void  c_mkdir_perm_ ( const char *, char * ) ;
void  c_mkdir_ ( const char *, int * ) ;
void  c_mkfifo_decf_ ( const char *, int * ) ;
void  c_mkfifo_octf_ ( const char *, int * ) ;
void  c_mkfifo_perm_ ( const char *, char * ) ;
void  c_mkfifo_ ( const char *, int * ) ;
void  c_perror_ ( char *, int * ) ;
void  c_rmdir_ ( const char * ) ;
int   c_rmpath__ ( const char * ) ;
void  c_rmpath_ ( const char * ) ;
void  c_seterrno_ ( int * );
void  c_strerror_ ( int *, char *, size_t *, size_t *, int * ); 


//
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

void  c_stat_ ( char *, dev_t *, ino_t *, mode_t *, nlink_t *, uid_t *, 
                gid_t *, dev_t *, off_t *, time_t *, time_t *, time_t *, 
                blksize_t *, blkcnt_t  * ) ; 


void  c_is_dir_ ( const char *, int * ) ;
void  c_is_reg_ ( const char *, int * ) ;
void  c_is_blkdev_ ( const char *, int * ) ;
void  c_is_chrdev_ ( const char *, int * ) ;
void  c_is_fifo_ ( const char *, int * ) ;
void  c_is_socket_ ( const char *, int * ) ;
void  c_is_link_ ( const char *, int * )  ;
void  c_is_exist_ ( const char *, int * ) ; 

//
#include <sys/types.h>

void  c_mkpath__( const char *, mode_t ) ; 
void  c_mkpath_ ( const char *, int * ) ; 


//
#include <time.h>

void  c_clock_ ( double * ) ;
void  c_ctime_ ( time_t *, char *, size_t *f, size_t * ) ;
void  c_strftime_ ( time_t *, char *, size_t *, size_t * ) ;
time_t c_time_ () ;

//
#include <sys/times.h>

clock_t c_times_ ( clock_t *, clock_t *, clock_t *, clock_t * ) ;  


//

#include <stdio.h>

void  c_fstdin_  ( FILE ** ) ;
void  c_fstdout_ ( FILE ** ) ;
void  c_fstderr_ ( FILE ** ) ;

void  c_fopen_  ( FILE **, char *, char * ) ; 
void  c_fclose_ ( FILE **, int * ) ;

void  c_fread_astr_ ( FILE **, char *, size_t *, size_t * ) ; 
void  c_fread_afloat_ ( FILE **, float *, size_t *, size_t * ) ;
void  c_fread_adouble_ ( FILE **, double *, size_t *, size_t * ) ;
void  c_fread_aint_ ( FILE **, int *, size_t *, size_t * ) ;
void  c_fread_along_ ( FILE **, long *, size_t *, size_t * ) ;

void  c_fwrite_astr_ ( FILE **, const char *, size_t *, size_t * ) ; 
void  c_fwrite_afloat_ ( FILE **, const float *, size_t *, size_t * ) ;
void  c_fwrite_adouble_ ( FILE **, const double *, size_t *, size_t * ) ;
void  c_fwrite_aint_ ( FILE **, const int *, size_t *, size_t * ) ;
void  c_fwrite_along_ ( FILE **, const long *, size_t *, size_t * ) ;

void  c_fputs_ ( FILE **, char *, int * ) ;
void  c_fputs_stdout_ ( char *, int * ) ;
void  c_fputs_stderr_ ( char *, int * ) ;

void  c_fputc_ ( FILE **, int  *, int * ) ;
void  c_fputc_stdout_ ( int *, int * ) ;
void  c_fputc_stderr_ ( int *, int * ) ;

void  c_fgetc_ ( FILE **, int  * ) ;
void  c_fgetc_stdin_ ( int * ) ; 

void  c_fgets_ ( FILE **, char *, int *, int * ) ;
void  c_fgets_stdin_ ( char *, int *, int * ) ;

void  c_fseek_  ( FILE **, long *,  int * ) ;
void  c_fseeko_ ( FILE **, off_t *, int *, int* ) ;

void  c_ftell_  ( FILE **, long * ) ;
void  c_ftello_ ( FILE **, off_t * ) ; 

void  c_fgetpos_ ( FILE **, fpos_t *, int * ) ;
void  c_fsetpos_ ( FILE **, const fpos_t *, int * ) ;

void  c_feof_   ( FILE **, int * ) ; 
void  c_ferror_ ( FILE **, int * ) ; 

void  c_fgetlen_ ( FILE **, long * ) ;

void  c_fflush_ ( FILE **, int * ) ; 
void  c_fflush_all_    ( int * ) ; 
void  c_fflush_stdin_  ( int * ) ; 
void  c_fflush_stdout_ ( int * ) ; 
void  c_fflush_stderr_ ( int * ) ; 

void  c_popen_  ( FILE **, const char *, const char *, int * ) ;
void  c_pclose_ ( FILE **, int * ) ;

void  c_popen_intref_ ( intptr_t *, const char *, const char *, int * ) ;
void  c_pclose_intref_ ( intptr_t *, int * ) ; 


void  c_getc_ ( FILE **, int  * ) ;
void  c_getc_intref_ ( intptr_t *, int  * ) ;
void  c_getc_stdin_ ( int * ) ;

void  c_putc_ ( FILE **, int  * ) ;
void  c_putc_intref_ ( intptr_t *, int  * ) ;
void  c_putc_stderr_ ( int * ) ;
void  c_putc_stdout_ ( int * ) ;

void  c_getchar_ ( int * ) ;
void  c_putchar_ ( int *, int * ) ;

void  c_fileno_ ( FILE *, int * ) ;

//
// New version: 
//    Pass arguments using its reference with value in integer(8), i.e.  
//    intptr_t defined in /usr/include/stdint.h
//
#include <stdint.h>

void  c_fopen_intref_ ( intptr_t *, char *, char * ) ; 
void  c_fclose_intref_ ( intptr_t *, int * ) ;
void  c_feof_intref_ ( intptr_t *, int * ) ;


void  c_fstdin_intref_ ( intptr_t * ) ;
void  c_fstdout_intref_ ( intptr_t * ) ;
void  c_fstderr_intref_ ( intptr_t * ) ;

void  c_fread_astr_intref_ ( intptr_t *, char *, size_t *, size_t * ) ;
void  c_fread_afloat_intref_ ( intptr_t *, float *, size_t *, size_t * ) ;
void  c_fread_adouble_intref_ ( intptr_t *, double *, size_t *, size_t * ) ;
void  c_fread_aint_intref_ ( intptr_t *, int *, size_t *, size_t * ) ;
void  c_fread_along_intref_ ( intptr_t *, long *, size_t *, size_t * ) ;

void  c_fwrite_astr_intref_ ( intptr_t *, const char *, size_t *, size_t * ) ;
void  c_fwrite_afloat_intref_ ( intptr_t *, const float *, size_t *, size_t * );
void  c_fwrite_adouble_intref_ ( intptr_t *, const double *, size_t *, size_t * ) ;
void  c_fwrite_aint_intref_ ( intptr_t *, const int *, size_t *, size_t * ) ;
void  c_fwrite_along_intref_ ( intptr_t *, const long *, size_t *, size_t * ) ;

void  c_fgetc_intref_ ( intptr_t *, int * ) ;
void  c_fgetc_intref_pre_ ( int *, intptr_t * ) ;
void  c_fgetc_intref_pro_ ( int *, int * ) ;
void  c_fgetc_intref_end_ ( int * ) ;

void  c_fputc_intref_ ( intptr_t *, int * ) ;

void  c_fseek_intref_ ( intptr_t *, long *, int *, int * ) ;
void  c_fseeko_intref_ ( intptr_t *, off_t *, int *, int * ) ;

void  c_fgetlen_intref_ ( intptr_t *, long * ) ;
void  c_fgetpos_intref_ ( intptr_t *, fpos_t *, int * ) ; 
void  c_fsetpos_intref_ ( intptr_t *, const fpos_t *, int * ) ; 

void  c_fgets_intref_ ( intptr_t *, char *, int *, int * ) ;
void  c_fputs_intref_ ( intptr_t *, char *, int * ) ;

void  c_frewind_intref_ ( intptr_t * ) ;

void  c_ftell_intref_ ( intptr_t *, long * ) ;
void  c_ftello_intref_ ( intptr_t *, off_t * ) ;

//

void  c_utils_vgetaddr_ ( void *, intptr_t * ) ; 
void  c_utils_vgetinfo_int_ ( intptr_t *, int * ) ;
void  c_utils_vgetinfo_long_ ( intptr_t *, long * ) ;
void  c_utils_vgetinfo_float_ ( intptr_t *, float * ) ;
void  c_utils_vgetinfo_double_ ( intptr_t *, double * ) ;
void  c_utils_vgetinfo_fptr_ ( intptr_t *, FILE * ) ;

/*
#include <dirent.h>
void  c_utils_vgetinfo_dptr_ ( intptr_t *, DIR * ) ;
*/



void  c_utils_vgetleng_char_ ( intptr_t *, size_t * ) ;
void  c_utils_vgetinfo_char_ ( intptr_t *, char *, size_t *, size_t * ) ;










//

/*
   SRC: 
      https://pubs.opengroup.org/onlinepubs/9699919799/functions/fflush.html

      If the stream FP points to an output stream or an update stream in which
   the most recent operation was not input, fflush() shall cause 
      any unwritten data for that stream to be written to the file, 
   and 
      the last data modification and last file status change timestamps
   of the underlying file shall be marked for update.

      For a stream open for reading with an underlying file description, if the
   file is not already at EOF, and the file is one capable of seeking, the file
   offset of the underlying open file description shall be set to the file 
   position of the stream, and any characters pushed back onto the stream by
   ungetc() or ungetwc() that have not subsequently been read from the stream
   shall be discarded (without further changing the file offset).

      If stream is a null pointer, fflush() shall perform this flushing action
   on all streams for which the behavior is defined above.

      Upon successful completion, fflush() shall return 
         0, 
   otherwise, it shall set the error indicator for the stream, return 
         EOF, 
   and set errno to indicate the error.


   EXAMPLES

      Sending Prompts to Standard Output

      The following example uses printf() calls to print a series of prompts
   for information the user must enter from standard input. 
      The fflush() calls force the output to standard output. 
      The fflush() function is used because standard output is usually buffered
   and the prompt may not immediately be printed on the output or terminal. 
      The getline() function calls read  strings from standard input and place
   the results in variables, for use later in the program.

    char       *user ;
    char       *oldpasswd ;
    char       *newpasswd ;
    ssize_t    llen ;
    size_t     blen ;
    struct termios term ;
    tcflag_t   saveflag ;

    printf ( "User name: " );
    fflush ( stdout );

    blen = 0;
    llen = getline ( &user, &blen, stdin );

    user[llen-1] = 0;

    tcgetattr ( fileno (stdin), &term );

    saveflag = term.c_lflag;

    term.c_lflag &= ~ECHO ;

    tcsetattr ( fileno(stdin), TCSANOW, &term );

    printf ( "Old password: " );
    fflush ( stdout );

    blen = 0;
    llen = getline ( &oldpasswd, &blen, stdin );

    oldpasswd[llen-1] = 0;

    printf ( "\nNew password: " );
    fflush ( stdout );

    blen = 0;
    llen = getline ( &newpasswd, &blen, stdin );

    newpasswd[llen-1] = 0;
    term.c_lflag = saveflag;

    tcsetattr ( fileno(stdin), TCSANOW, &term );

    free ( user );
    free ( oldpasswd );
    free ( newpasswd );



*/


//
#include <dirent.h>

void  c_opendir_ ( char *, DIR ** ) ;
void  c_readdir_ ( DIR **, char *, size_t *, size_t * ) ;  
void  c_closedir_ ( DIR ** ) ;
void  c_rewinddir_ ( DIR ** ) ;

//

void  c_opendir_intref_ ( const char *, intptr_t * ) ;
void  c_readdir_intref_ ( intptr_t *, char *, size_t *, size_t * ) ; 
void  c_rewinddir_intref_ ( intptr_t * ) ;
void  c_closedir_intref_ ( intptr_t * ) ;

//












