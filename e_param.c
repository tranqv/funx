////////////////////////////////////////////////////////////////////////////////
//
//    This file is to define all common and regular parameters in Unix
//
//
#include <stdio.h>
#include <time.h>
#include <dirent.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdint.h>
#include <netdb.h>

#include "i_utils.h"

int main()
{
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "THE FOLLOWING CONTENT IS GENERATED FROM e_param.c");
   printf( "%-6s%s\n", "!", "EDITTING IT YOU'LL GET WHAT YOU ARE DESERVED.");
   printf( "%-6s%s\n", "!", "" );

   const char *fmt1 = "%-6sinteger,parameter :: %-13s = %2d\n" ; 
   const char *fst1 = "%-6s%s";
//
   printf( "%-6s%s\n", "!", "" ) ;
   printf( "%-6s%s\n", "!", "character(len=1,kind=ck_char) :: ???" );
   printf( "%-6s%s\n", "!", "" ) ;
   printf( fmt1, "", "ck_char", (int) sizeof(char) );
   printf( fmt1, "", "ck_signed_char", (int) sizeof(signed char) );
// Fortran does not have this kind, use integer(kind=2) instead. OK?
// printf( fmt1, "", "ck_unsigned_char", (int) sizeof(unsigned char) );
//
   printf( "%-6s%s\n", "!", "" ) ;
   printf( "%-6s%s\n", "!", "logical(kind=ck_bool) ::" );
   printf( "%-6s%s\n", "!", "" ) ;
   printf( fmt1, "", "ck_bool", (int) sizeof(_Bool) );
//
   printf( "%-6s%s\n", "!", "" ) ;
   printf( "%-6s%s\n", "!", "integer(kind=ck_...) ::" );
   printf( "%-6s%s\n", "!", "" ) ;

   printf( fmt1, "", "ck_int", (int) sizeof(int) );
   printf( fmt1, "", "ck_short", (int) sizeof(short int) );
   printf( fmt1, "", "ck_long", (int) sizeof(long) );
   printf( fmt1, "", "ck_long_int", (int) sizeof(long int) );
   printf( fmt1, "", "ck_long_long", (int) sizeof(long long int) );

// 
   printf( "%-6s%s\n", "!", "" ) ;
   printf( "%-6s%s\n", "!", "real(kind=ck_...) ::" );
   printf( "%-6s%s\n", "!", "" ) ;

   printf( fmt1, "", "ck_float", (int) sizeof(float) );
   printf( fmt1, "", "ck_double", (int) sizeof(double) );
   printf( fmt1, "", "ck_long_double", (int) sizeof(long double) );
// 
   printf( "%-6s%s\n", "!", "" ) ;
   printf( "%-6s%s\n", "!", "complex(kind=ck_...) ::" );
   printf( "%-6s%s\n", "!", "" ) ;

   printf( fmt1, "", "ck_float_complex", (int) sizeof(float _Complex) );
   printf( fmt1, "", "ck_double_complex", (int) sizeof(double _Complex) );
   printf( fmt1, "", "ck_long_double_complex", (int) sizeof(long double _Complex) );

//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define constant mode_t for mkdir, mkfifo" );
   printf( "%-6s%s\n", "!", "Define constants for stat from <sys/stat.h>" );
   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck_mode_t",  sizeof(mode_t) );
   printf( fmt1, "", "ck_time_t", (int) sizeof(time_t) );
   printf( fmt1, "", "ck_clock_t", sizeof(clock_t) );
   printf( fmt1, "", "ck_uid_t", sizeof(uid_t) );
   printf( fmt1, "", "ck_gid_t", sizeof(gid_t) );
   printf( fmt1, "", "ck_pid_t", sizeof(pid_t) );
   printf( fmt1, "", "ck_size_t", sizeof(size_t) );
   printf( fmt1, "", "ck_ssize_t", sizeof(ssize_t) );
// printf( fmt1, "", "ck_null", NULL );
// printf( fmt1, "", "ck_l_ctermid", L_ctermid );
   printf( fmt1, "", "ck_dev_t", sizeof(dev_t) );
   printf( fmt1, "", "ck_ino_t", sizeof(ino_t) );
   printf( fmt1, "", "ck_off_t", sizeof(off_t) );
   printf( fmt1, "", "ck_nlink_t", sizeof(nlink_t) );
   printf( fmt1, "", "ck_blksize_t", sizeof(blksize_t) );
   printf( fmt1, "", "ck_blkcnt_t", sizeof(blkcnt_t) );
   printf( fmt1, "", "ck_fpos_t", sizeof(fpos_t) );
// printf( fmt1, "", "ck_va_list", sizeof(va_list) );
   printf( fmt1, "", "ck_null", NULL );
   printf( fmt1, "", "ck_intmax_t", sizeof(intmax_t) );
//
//
// NOTE ON POINTER IMPLEMENTAIONIN IN FORTRAN. Make sure that:
//
//    sizeof(intptr_t) =  sizeof(DIR *) ) = sizeof(FILE *) 
//
// which all return 8 (in byte). Or, use use INTEGER(8) for storing pointer
// references. In Fotran lib, I use INTEGER(kind=intptr_t) for all pointers 
// (FILE *), (DIR *), anf for any other pointers. 
//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define void* pointer in C language," );
   printf( "%-6s%s\n", "!", "where intptr_t (=8) is from #include <stdint.h>" );

   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck_intptr_t", sizeof(intptr_t) );

   printf( fst1, "", "type ck_voidptr \n" );
// printf( fst1, "", "   private \n"  );  // turn on in a module.
   printf( fst1, "", "   integer(kind = ck_intptr_t) :: ptr \n"  );
   printf( fst1, "", "end type ck_voidptr \n" );

   printf( fst1, "", "type(ck_voidptr),parameter :: ck_nullptr = ck_voidptr(0)\n"  );


//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define stat from <stat/stat.h>, i.e. <bits/stat.h>" );
   printf( "%-6s%s\n", "!", "" );

   printf( fst1, "", "type ck_stat \n" );
// printf( fst1, "", "   private \n"  );  // turn on in a module.
   printf( fst1, "", "   integer(kind = ck_dev_t)      :: st_dev \n"  );
   printf( fst1, "", "   integer(kind = ck_ino_t)      :: st_ino \n"  );
   printf( fst1, "", "   integer(kind = ck_mode_t)     :: st_mode \n"  );
   printf( fst1, "", "   integer(kind = ck_nlink_t)    :: st_nlink \n"  );
   printf( fst1, "", "   integer(kind = ck_uid_t)      :: st_uid \n"  );
   printf( fst1, "", "   integer(kind = ck_gid_t)      :: st_gid \n"  );
   printf( fst1, "", "   integer(kind = ck_dev_t)      :: st_rdev \n"  );
   printf( fst1, "", "   integer(kind = ck_off_t)      :: st_size \n"  );
   printf( fst1, "", "   integer(kind = ck_time_t)     :: st_atime \n"  );
   printf( fst1, "", "   integer(kind = ck_time_t)     :: st_mtime \n"  );
   printf( fst1, "", "   integer(kind = ck_time_t)     :: st_ctime \n"  );
   printf( fst1, "", "   integer(kind = ck_blksize_t)  :: st_blksize \n"  );
   printf( fst1, "", "   integer(kind = ck_blkcnt_t)   :: st_blocks \n"  );
   printf( fst1, "", "end type ck_stat\n" );

   printf( "%-6s%s\n", "!", "" );
//


//
   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck__sc_arg_max", _SC_ARG_MAX );
   printf( fmt1, "", "ck__sc_child_max", _SC_CHILD_MAX );
   printf( fmt1, "", "ck__sc_host_name_max", _SC_HOST_NAME_MAX );
   printf( fmt1, "", "ck__sc_login_name_max", _SC_LOGIN_NAME_MAX );
   printf( fmt1, "", "ck__sc_clk_tck", _SC_CLK_TCK );
   printf( fmt1, "", "ck__sc_open_max", _SC_OPEN_MAX );
   printf( fmt1, "", "ck__sc_pagesize", _SC_PAGESIZE );
   printf( fmt1, "", "ck__sc_re_dup_max", _SC_RE_DUP_MAX );
   printf( fmt1, "", "ck__sc_stream_max", _SC_STREAM_MAX );
   printf( fmt1, "", "ck__sc_symloop_max", _SC_SYMLOOP_MAX );
   printf( fmt1, "", "ck__sc_tty_name_max", _SC_TTY_NAME_MAX );
   printf( fmt1, "", "ck__sc_tzname_max", _SC_TZNAME_MAX );
   printf( fmt1, "", "ck__sc_version", _SC_VERSION );

//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define the DIR * handler:" );
   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck_dirptr", sizeof(DIR *) );
   printf( fst1, "", "type ck_dir \n" );
// printf( fst1, "", "   private \n"  );  // turn on in a module.
   printf( fst1, "", "   integer(kind = ck_dirptr) :: ptr \n"  );
// printf( fst1, "", "   integer(kind = ck_intptr_t) :: ptr \n"  );
   printf( fst1, "", "end type ck_dir \n" );
//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define the FILE handler:" );
   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck_fileptr", sizeof(FILE *) );
   printf( fst1, "", "type ck_file \n" );
// printf( fst1, "", "   private \n"  );  // turn on in a module.
   printf( fst1, "", "   integer(kind = ck_fileptr) :: ptr \n"  );
// printf( fst1, "", "   integer(kind = ck_intptr_t) :: ptr \n"  );
   printf( fst1, "", "end type ck_file \n" );

   printf( fmt1, "", "ck_eof", EOF );
   printf( fmt1, "", "ck_seek_set", SEEK_SET );
   printf( fmt1, "", "ck_seek_cur", SEEK_CUR );
   printf( fmt1, "", "ck_seek_end", SEEK_END );

//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define constants for File" );
   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck_f_ok", F_OK );
   printf( fmt1, "", "ck_r_ok", R_OK );
   printf( fmt1, "", "ck_w_ok", W_OK );
   printf( fmt1, "", "ck_x_ok", X_OK );

   printf( fmt1, "", "ck_s_irusr", S_IRUSR );
   printf( fmt1, "", "ck_s_iwusr", S_IWUSR );
   printf( fmt1, "", "ck_s_ixusr", S_IXUSR );
   printf( fmt1, "", "ck_s_irwxu", S_IRWXU );

   printf( fmt1, "", "ck_s_irgrp", S_IRGRP );
   printf( fmt1, "", "ck_s_iwgrp", S_IWGRP );
   printf( fmt1, "", "ck_s_ixgrp", S_IXGRP );
   printf( fmt1, "", "ck_s_irwxg", S_IRWXG );


   printf( fmt1, "", "ck_s_iroth", S_IROTH );
   printf( fmt1, "", "ck_s_iwoth", S_IWOTH );
   printf( fmt1, "", "ck_s_ixoth", S_IXOTH );
   printf( fmt1, "", "ck_s_irwxo", S_IRWXO );

   printf( fmt1, "", "ck_s_isgid", S_ISGID );
   printf( fmt1, "", "ck_s_isuid", S_ISUID );

//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define some constants in <linux/limits.h>" );
   printf( "%-6s%s\n", "!", "Note: <i_utils.h> re-defines the names" );
   printf( "%-6s%s\n", "!", "    MAXLEN_PATHNAME := PATH_MAX" );
   printf( "%-6s%s\n", "!", "    MAXLEN_FILENAME := NAME_MAX" );
   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck_path_max", MAXLEN_PATHNAME );
   printf( fmt1, "", "ck_name_max", MAXLEN_FILENAME );

//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "ASCII:" );
   printf( "%-6s%s\n", "!", "" );

   const char *fmt2 = 
      "%-6sinteger,parameter :: %-12s = %3d  ! %s\n" ; 

   printf( fmt2, "", "ck_icha_nul",     0, "NULL char" );
   printf( fmt2, "", "ck_icha_soh",     1, "Start Of Heading" );
   printf( fmt2, "", "ck_icha_stx",     2, "Start of TeXt" );
   printf( fmt2, "", "ck_icha_etx",     3, "End   of TeXt" );
   printf( fmt2, "", "ck_icha_eot",     4, "End Of Transmission" );
   printf( fmt2, "", "ck_icha_enq",     5, "ENQuiry" );
   printf( fmt2, "", "ck_icha_ack",     6, "Acknowledge" );
   printf( fmt2, "", "ck_icha_bel",  '\a', "Alert, Bell" );
   printf( fmt2, "", "ck_icha_bs ",  '\b', "Back Space" );
   printf( fmt2, "", "ck_icha_ff ",  '\f', "New Page, Form Feed" );
   printf( fmt2, "", "ck_icha_lf ",  '\n', "New Line, Line Feed" );
   printf( fmt2, "", "ck_icha_cr ",  '\r', "Carriage Return" );
   printf( fmt2, "", "ck_icha_tab",  '\t', "Horizontal Tab" );
   printf( fmt2, "", "ck_icha_vt ",  '\v', "Vertical Tab" );
   printf( fmt2, "", "ck_icha_sub",    26, "Substitute" );
   printf( fmt2, "", "ck_icha_esc",    27, "Escape" );
   printf( fmt2, "", "ck_icha_fs ",    28, "File Separator" );
   printf( fmt2, "", "ck_icha_gs ",    29, "Group Separator" );
   printf( fmt2, "", "ck_icha_rs ",    30, "Record Separator" );
   printf( fmt2, "", "ck_icha_us ",    31, "Unit Separator" );

   printf( "%-6s%s\n", "!", "" );

   const char *fmt3 = 
      "%-6scharacter(len=1),parameter :: %-12s = achar(%3d)  ! %s\n" ; 

   printf( fmt3, "", "ck_char_nul",     0, "NULL char" );
   printf( fmt3, "", "ck_char_soh",     1, "Start Of Heading" );
   printf( fmt3, "", "ck_char_stx",     2, "Start of TeXt" );
   printf( fmt3, "", "ck_char_etx",     3, "End   of TeXt" );
   printf( fmt3, "", "ck_char_eot",     4, "End Of Transmission" );
   printf( fmt3, "", "ck_char_enq",     5, "ENQuiry" );
   printf( fmt3, "", "ck_char_ack",     6, "Acknowledge" );
   printf( fmt3, "", "ck_char_bel",  '\a', "Alert, Bell" );
   printf( fmt3, "", "ck_char_bs ",  '\b', "Back Space" );
   printf( fmt3, "", "ck_char_ff ",  '\f', "New Page, Form Feed" );
   printf( fmt3, "", "ck_char_lf ",  '\n', "New Line, Line Feed" );
   printf( fmt3, "", "ck_char_cr ",  '\r', "Carriage Return" );
   printf( fmt3, "", "ck_char_tab",  '\t', "Horizontal Tab" );
   printf( fmt3, "", "ck_char_vt ",  '\v', "Vertical Tab" );
   printf( fmt3, "", "ck_char_sub",    26, "Substitute" );
   printf( fmt3, "", "ck_char_esc",    27, "Escape" );
   printf( fmt3, "", "ck_char_fs ",    28, "File Separator" );
   printf( fmt3, "", "ck_char_gs ",    29, "Group Separator" );
   printf( fmt3, "", "ck_char_rs ",    30, "Record Separator" );
   printf( fmt3, "", "ck_char_us ",    31, "Unit Separator" );

//
   printf( "%-6s%s\n", "!", "" );
   printf( "%-6s%s\n", "!", "Define some constants for Networking" ) ; 
   printf( "%-6s%s\n", "!", "   #include <stdint.h>" ) ;
   printf( "%-6s%s\n", "!", "" );

   printf( fmt1, "", "ck_uint16_t", sizeof(uint16_t) );
   printf( fmt1, "", "ck_uint32_t", sizeof(uint32_t) );

   printf( fmt1, "", "ck_hostentptr", sizeof(struct hostent *) );


//
//
   printf( "%-6s%s\n", "!", "" );
   return 0;
}

/*

#include <stdio.h>
   /usr/include/stdio.h
   +  printf, fprintf, vprintf, vfprintf, putc, fputc, 
      gets, fgets
   +  fopen, fclose, fread, fwrite,  

#include <dirent.h>
   /usr/include/dirent.h
   +  DIR   
         This is the data type of directory stream objects.
         The actual structure is opaque to users.  
         typedef struct __dirstream DIR;
   +  opendir, readdir, closedir, rewinddir, seekdir, ... 

#include <time.h>
   /usr/include/time.h
   +  clock_t, time_t,
   +  clock, 
         clock_t clock ( void ) ;
      Time used by the program so far (user time + system time).
      The result / CLOCKS_PER_SEC is program time in seconds,   
      where CLOCKS_PER_SEC is constant defined in <bits/time.h>, i.e. 
      /usr/include/x86_64-linux-gnu/bits/time.h
   +  time,
         time_t time ( time_t *timer )
      Return the current time and put it in *TIMER if TIMER is not NULL.
   +  difftime,
         double difftime ( time_t time1, time_t time0 )
      Return the difference between TIME1 and TIME0.
   +  mktime, 
         time_t mktime (struct tm *tp)
      Return the 'time_t' representation of TP and normalize TP.  
   +  strftime ( char *s, size_t maxsize, const char *format, const struct tm *tp )  
         Format TP into S according to FORMAT.   
      Write no more than MAXSIZE characters and return the number
      of characters written, or 0 if it would exceed MAXSIZE.  
   +  gmtime,
         struct tm *gmtime ( const time_t *timer ) 
      Return the 'struct tm' representation of *TIMER in Universal 
      Coordinated Time (aka Greenwich Mean Time). 
   +  localtime,
         struct tm *localtime ( const time_t *timer ) 
      Return the 'struct tm' representation of *TIMER in the local timezone.

#include <sys/types.h>
   /usr/include/x86_64-linux-gnu/sys/types.h
   +  #include <bits/types.h>      --> For __mode_t and __dev_t. 
   +  pid_t, uid_t, gid_t, dev_t, mode_t, nlink_t,
      u_char, u_short, u_int, u_long, quad_t, u_quad_t, fsid_t,
      off_t, ino_t,  

#include <sys/stat.h>
   /usr/include/x86_64-linux-gnu/sys/stat.h
   +  #include <bits/types.h>      --> For __mode_t and __dev_t. 
   +  mode_t, dev_t, gid_t, ino_t, 
   +  mkdir, mkfifo, 
   +  chmod,
         int chmod ( const char * FILE, mode_t MODE )
            Set file access permissions for FILE to MODE.
         If FILE is a symbolic link, this affects its target instead. 
   +  umask
         mode_t umask ( mode_t cmask )
            Set the file creation mask of the current process to MASK,
         and return the old creation mask. 

   +  #include <bits/stat.h>      
      /usr/include/x86_64-linux-gnu/bits/stat.h
      --> For definition of  
         struct stat  
         { 
            dev_t       st_dev         device number of filesystem.
            ino_t       st_ino         inode number.
            mode_t      st_mode        file mode (type and permissions). (in decimal value)
            nlink_t     st_nlink       number of (hard) links to the file.
            uid_t       st_uid         numeric user ID of file's owner.
            gid_t       st_gid         numeric group ID of file's owner.
            dev_t       st_rdev        the device identifier (special files only).
            off_t       st_size        total size of file, in bytes.
            time_t      st_atime       last access time in seconds since the epoch.
            time_t      st_mtime       last modify time in seconds since the epoch.
            time_t      st_ctime       inode change time in seconds since the epoch (*).
                                       Not all fields are supported on all filesystem types. 
                                       Notably, the ctime field is non-portable.
            blksize_t   st_blksize     preferred I/O size in bytes for interacting with the
                                       file (may vary from file to file).
            blkcnt_t    st_blocks      actual number of system-specific blocks allocated
                                       on disk (often, but not always, 512 bytes each).
         }
   +

   +  S_IRGRP  Read by group. 
   +  S_IWGRP  Write by group. 
   +  S_IXGRP  Execute by group.
   +  S_IRWXG  Read, write, and execute by group.

   +  S_IROTH  Read by others.
   +  S_IWOTH  Write by others.
   +  S_IXOTH  Execute by others.
   +  S_IRWXO  Read, write, and execute by others. 
 
   +  S_IRUSR  Read by owner.  
   +  S_IWUSR  Write by owner.
   +  S_IXUSR  Execute by owner.
   +  S_IRWXU  Read, write, and execute by owner. 

   +  S_ISUID  Set user ID on execution. 
   +  S_ISGID  Set group ID on execution 
   + 
   +  S_ISDIR (mode)    __S_ISTYPE((mode), __S_IFDIR)
   +  S_ISCHR (mode)    __S_ISTYPE((mode), __S_IFCHR)
   +  S_ISBLK (mode)    __S_ISTYPE((mode), __S_IFBLK)
   +  S_ISREG (mode)    __S_ISTYPE((mode), __S_IFREG)
   +  S_ISFIFO (mode)   __S_ISTYPE((mode), __S_IFIFO)
   +  S_ISLNK (mode)    __S_ISTYPE((mode), __S_IFLNK)

   +  stat
         The stat() function shall obtain information about the named file and 
      write it to the area pointed to by the buf argument. The path argument 
      points to a pathname naming a file. Read, write, or execute permission of 
      the named file is not required. An implementation that provides additional 
      or alternate file access control mechanisms may, under 
      implementation-defined conditions, cause stat() to fail. In particular, 
      the system may deny the existence of the file specified by path. 
         If the named file is a symbolic link, the stat() function shall 
      continue pathname resolution using the contents of the symbolic link, 
      and shall return information pertaining to the resulting file if the 
      file exists.

   +  lstat 
         The lstat() function shall be equivalent to stat(), except when path 
      refers to a symbolic link. In that case lstat() shall return information 
      about the link, while stat() shall return information about the file the 
      link references.

#include <unistd.h>
   /usr/include/unistd.h            POSIX Standard: 2.10 Symbolic Constants
   +  R_OK  = 4 Test for read permission.
   +  W_OK  = 2 Test for write permission.
   +  X_OK  = 1 Test for execute permission. 
   +  F_OK  = 0 Test for existence. 
   +  access, 
         int access (const char *name, int type)
      Test for access to NAME using the real UID and real GID. 

   +  close, 
   +  read, 
   +  write, 
   +  pread
         Read NBYTES into BUF from FD at the given position OFFSET without
      changing the file pointer.  Return the number read, -1 for errors
      or 0 for EOF.
   +  pwrite 
         Write N bytes of BUF to FD at the given position OFFSET without
      changing the file pointer.  Return the number written, or -1.
   +  pipe
         Create a one-way communication channel (pipe).
      If successful, two file descriptors are stored in PIPEDES;
      bytes written on PIPEDES[1] can be read from PIPEDES[0].
      Returns 0 if successful, -1 if not.  
   +  sleep
   +  chown, 
   +  chdir,  
   +  getcwd,
   +  execve, execv, 
   +  pathconf, fpathconf, sysconf,
   +  getpid, getppid, getpgrp, __getpgid, 
   +  setpgid, setpgrp, setsid,
   +  getuid, geteuid, getgid, getegid, getgroups,
   +  setuid, setgid,
   +  fork, 
   +  ttyname, isatty,  
   +  link, symlink, unlink, 
   +  rmdir, 
   +  tcgetpgrp, tcsetpgrp,  
   +  getlogin, 
   +  fsync, 
   +  #include <bits/types.h>  --> /usr/include/x86_64-linux-gnu/bits/types.h

   +  readlink 
         ssize_t readlink( const char *path, char *buf, size_t bufsize )

         The readlink() function shall place the contents of the symbolic link 
      referred to by PATH in the buffer BUF which has size BUFSIZE. If the number 
      of bytes in the symbolic link is less than BUFSIZE, the contents of the 
      remainder of BUF are unspecified. If the BUF argument is not large enough 
      to contain the link content, the first BUFSIZE bytes shall be placed in BUF.
         If the value of BUFSIZE is greater than {SSIZE_MAX}, the result is 
      implementation-defined.
         Upon successful completion, readlink() shall mark for update the last 
      data access timestamp of the symbolic link.

      RETURN VALUE:
         Upon successful completion, these functions shall return 
            the count of bytes placed in the buffer. 
         Otherwise, these functions shall return a value of 
            -1
         leave the buffer unchanged, and set ERRNO to indicate the error.

      ERRORS:
         [EACCES]
            Search permission is denied for a component of the path prefix of PATH.
         [EINVAL]
            The PATH argument names a file that is not a symbolic link.
         [EIO]
            An I/O error occurred while reading from the file system.
         [ELOOP]
            A loop exists in symbolic links encountered during resolution of the PATH 
            argument.
         [ENAMETOOLONG]
            The length of a component of a pathname is longer than {NAME_MAX}.
         [ENOENT]
            A component of PATH does not name an existing file or PATH is an empty 
            string.
         [ENOTDIR]
            A component of the PATH prefix names an existing file that is neither a 
            directory nor a symbolic link to a directory, or the PATH argument 
            contains at least one non- <slash> character and ends with one or more 
            trailing <slash> characters and the last pathname component names an 
            existing file that is neither a directory nor a symbolic link to a 
            directory.
      REF:
         https://pubs.opengroup.org/onlinepubs/9699919799/functions/readlink.html 

#include <linux/limits.h>
   /usr/include/linux/limits.h
   +  PATH_MAX = 4096 
      chars in a path name including nul,
   +  NAME_MAX = 255   
      chars in a file name,
   +  LINK_MAX = 127
      links a file may have
   +  ARG_MAX = 131072      
      bytes of args + environ for exec()

#include <stdlib.h>
   /usr/include/stdlib.h

   +  realpath 

         char *realpath ( const char *file_name, char *resolved_name )

         Return the canonical absolute name of FILE_NAME. If RESOLVED_NAME 
      is null, the result is malloc'd; otherwise, if the canonical name is
      PATH_MAX chars or more, returns null with 'errno' set to ENAMETOOLONG; 
      if the name fits in fewer than PATH_MAX chars, returns the name in 
      RESOLVED.

         Upon successful completion, realpath() shall return a pointer to 
      the resolved name. Otherwise, realpath() shall return a null pointer 
      and set errno to indicate the error, and the contents of the buffer 
      pointed to by resolved_name are undefined.

      ERRORS

         The realpath() function shall fail if:

      [EACCES]
         Read or search permission was denied for a component of file_name.
      [EINVAL]
         The file_name argument is a null pointer.
      [EIO]
         An error occurred while reading from the file system.
      [ELOOP]
         A loop exists in symbolic links encountered during resolution of the 
         file_name argument.
      [ENAMETOOLONG]
         The length of the file_name argument exceeds {PATH_MAX} or a pathname 
         component is longer than {NAME_MAX}.
      [ENOENT]
         A component of file_name does not name an existing file or file_name 
         points to an empty string.
      [ENOTDIR]
         A component of the path prefix is not a directory.

      The realpath() function may fail if:

      [ELOOP]
         More than {SYMLOOP_MAX} symbolic links were encountered during resolution 
         of the file_name argument.
      [ENAMETOOLONG]
         Pathname resolution of a symbolic link produced an intermediate result 
         whose length exceeds {PATH_MAX}.
      [ENOMEM]
         Insufficient storage space is available.

#include <stdint.h>
   /usr/include/stdint.h
   Here below 8,16,32,64 are the numbers of Bits, 8 bit = 1 byte, 64 bit = 8 byte
   +  int8_t, int16_t, int32_t, int64_t,
   +  uint8_t, uint16_t, uint32_t, uint64_t,
   +  int_least8_t, int_least16_t, int_least32_t, int_least64_t,
   +  uint_least8_t, uint_least16_t, uint_least32_t, uint_least64_t,
   +  intptr_t
         integer value of size of reference (pointer, address) 
            integer(kind=intptr_t) :: xref 
   +  uintptr_t,
   +  intmax_t, uintmax_t,

#include <netdb.h>
   /usr/include/netdb.h
   +  Description of data base entry for a single host
      struct hostent
      {
         char  *h_name;          // Official name of host.    
         char  **h_aliases;      // Alias list.    
         int   h_addrtype;		   // Host address type.    
         int   h_length;         // Length of address.    
         char  **h_addr_list;    // List of addresses from name server. 
      };

   +  void sethostent (int __stay_open);
   +  void endhostent (void);
   +  struct hostent *gethostent (void);
   +  struct hostent *gethostbyaddr (const void *addr, socklen_t len, int type );
   +  struct hostent *gethostbyname (const char *name );
   +  void setnetent (int stay_open);  
   +  void endnetent (void);
   +  struct netent *getnetent (void);
      wherein the description of data base entry for a single network:
         struct netent
         {
            char *n_name;			// Official name of network.  //
            char **n_aliases;		// Alias list.  //
            int n_addrtype;		// Net address type.  //
            uint32_t n_net;		// Network number.  //
         };
      was defined in #include <bits/netdb.h>
         /usr/include/x86_64-linux-gnu/bits/netdb.h
      But, never include <bits/netdb.h> directly; use <netdb.h> instead.

   +  struct netent *getnetbyaddr (uint32_tnet, int type);
   +  struct netent *getnetbyname (const char *name);
   +  Description of data base entry for a single service 
      struct servent
      {
         char *s_name;        // Official service name.  //
         char **s_aliases;    // Alias list.  //
         int s_port;          // Port number.  //
         char *s_proto;       // Protocol to use.  //
      };

   +  void setservent (int __stay_open) ;
   +  void endservent (void);
   +  struct servent *getservent (void);
   +  struct servent *getservbyname (const char *__name, const char *__proto);
   +  struct servent *getservbyport (int __port, const char *__proto); 
   +  Description of data base entry for a single service  
      struct protoent
      {
         char *p_name;        // Official protocol name. 
         char **p_aliases;    // Alias list.  
         int p_proto;         // Protocol number.  
      };

   +  void setprotoent (int __stay_open);
   +  void endprotoent (void);
   +  struct protoent *getprotoent (void);
   +  struct protoent *getprotobyname (const char *__name); 
   +  struct protoent *getprotobynumber (int __proto); 
   +   
   +  


#include <sys/socket.h>
   /usr/include/x86_64-linux-gnu/sys/socket.h
   +  int accept ( 
      int socket, struct sockaddr *restrict address, socklen_t *address_len );




*/




////////////////////////////////////////////////////////////////////////////////

/*

*** NAME:

    getlogin, getlogin_r - get login name

SYNOPSIS

    #include <unistd.h>

    char *getlogin(void);
    int getlogin_r(char *name, size_t namesize);

DESCRIPTION

    The getlogin() function shall return a pointer to a string containing the user name associated by the login activity with the controlling terminal of the current process. If getlogin() returns a non-null pointer, then that pointer points to the name that the user logged in under, even if there are several login names with the same user ID.

    The getlogin() function need not be thread-safe.

    The getlogin_r() function shall put the name associated by the login activity with the controlling terminal of the current process in the character array pointed to by name. The array is namesize characters long and should have space for the name and the terminating null character. The maximum size of the login name is {LOGIN_*** NAME:_MAX}.

    If getlogin_r() is successful, name points to the name the user used at login, even if there are several login names with the same user ID.

    The getlogin() and getlogin_r() functions may make use of file descriptors 0, 1, and 2 to find the controlling terminal of the current process, examining each in turn until the terminal is found. If in this case none of these three file descriptors is open to the controlling terminal, these functions may fail. The method used to find the terminal associated with a file descriptor may depend on the file descriptor being open to the actual terminal device, not /dev/tty.

RETURN VALUE

    Upon successful completion, getlogin() shall return a pointer to the login name or a null pointer if the user's login name cannot be found. Otherwise, it shall return a null pointer and set errno to indicate the error.

    The application shall not modify the string returned. The returned pointer might be invalidated or the string content might be overwritten by a subsequent call to getlogin(). The returned pointer and the string content might also be invalidated if the calling thread is terminated.

    If successful, the getlogin_r() function shall return zero; otherwise, an error number shall be returned to indicate the error.

ERRORS

    These functions may fail if:

    [EMFILE]
        All file descriptors available to the process are currently open.
    [ENFILE]
        The maximum allowable number of files is currently open in the system.
    [ENOTTY]
        None of the file descriptors 0, 1, or 2 is open to the controlling terminal of the current process.
    [ENXIO]
        The calling process has no controlling terminal.

    The getlogin_r() function may fail if:

    [ERANGE]
        The value of namesize is smaller than the length of the string to be returned including the terminating null character.

The following sections are informative.
EXAMPLES

    Getting the User Login Name

    The following example calls the getlogin() function to obtain the name of the user associated with the calling process, and passes this information to the getpwnam() function to get the associated user database information.

    #include <unistd.h>
    #include <sys/types.h>
    #include <pwd.h>
    #include <stdio.h>
    ...
    char *lgn;
    struct passwd *pw;
    ...
    if ((lgn = getlogin()) == NULL || (pw = getpwnam(lgn)) == NULL) {
        fprintf(stderr, "Get of user information failed.\n"); exit(1);
        }

APPLICATION USAGE

    Three names associated with the current process can be determined: getpwuid(geteuid()) shall return the name associated with the effective user ID of the process; getlogin() shall return the name associated with the current login activity; and getpwuid(getuid()) shall return the name associated with the real user ID of the process.

    The getlogin_r() function is thread-safe and returns values in a user-supplied buffer instead of possibly using a static data area that may be overwritten by each call.

RATIONALE

    The getlogin() function returns a pointer to the user's login name. The same user ID may be shared by several login names. If it is desired to get the user database entry that is used during login, the result of getlogin() should be used to provide the argument to the getpwnam() function. (This might be used to determine the user's login shell, particularly where a single user has multiple login shells with distinct login names, but the same user ID.)

    The information provided by the cuserid() function, which was originally defined in the POSIX.1-1988 standard and subsequently removed, can be obtained by the following:

    getpwuid(geteuid())

    while the information provided by historical implementations of cuserid() can be obtained by:

    getpwuid(getuid())

    The thread-safe version of this function places the user name in a user-supplied buffer and returns a non-zero value if it fails. The non-thread-safe version may return the name in a static data area that may be overwritten by each call.

*/


/*
*** NAME:

    gethostname - get name of current host

SYNOPSIS

    #include <unistd.h>

    int gethostname(char *name, size_t namelen);

DESCRIPTION

    The gethostname() function shall return the standard host name for the current machine. The namelen argument shall specify the size of the array pointed to by the name argument. The returned name shall be null-terminated, except that if namelen is an insufficient length to hold the host name, then the returned name shall be truncated and it is unspecified whether the returned name is null-terminated.

    Host names are limited to {HOST_*** NAME:_MAX} bytes.

RETURN VALUE

    Upon successful completion, 0 shall be returned; otherwise, -1 shall be returned.

*/


/*
*** NAME:

    getppid - get the parent process ID

SYNOPSIS

    #include <unistd.h>

    pid_t getppid(void);

DESCRIPTION

    The getppid() function shall return the parent process ID of the calling process.

RETURN VALUE

    The getppid() function shall always be successful and no return value is reserved to indicate an error.




*** NAME:

    getsockopt - get the socket options

SYNOPSIS

    #include <sys/socket.h>

    int getsockopt(int socket, int level, int option_name,
           void *restrict option_value, socklen_t *restrict option_len);

DESCRIPTION

    The getsockopt() function manipulates options associated with a socket.

    The getsockopt() function shall retrieve the value for the option specified by the option_name argument for the socket specified by the socket argument. If the size of the option value is greater than option_len, the value stored in the object pointed to by the option_value argument shall be silently truncated. Otherwise, the object pointed to by the option_len argument shall be modified to indicate the actual length of the value.

    The level argument specifies the protocol level at which the option resides. To retrieve options at the socket level, specify the level argument as SOL_SOCKET. To retrieve options at other levels, supply the appropriate level identifier for the protocol controlling the option. For example, to indicate that an option is interpreted by the TCP (Transmission Control Protocol), set level to IPPROTO_TCP as defined in the <netinet/in.h> header.

    The socket in use may require the process to have appropriate privileges to use the getsockopt() function.

    The option_name argument specifies a single option to be retrieved. It can be one of the socket-level options defined in <sys/socket.h> and described in Use of Options.

RETURN VALUE

    Upon successful completion, getsockopt() shall return 0; otherwise, -1 shall be returned and errno set to indicate the error.

ERRORS

    The getsockopt() function shall fail if:

    [EBADF]
        The socket argument is not a valid file descriptor.
    [EINVAL]
        The specified option is invalid at the specified socket level.
    [ENOPROTOOPT]
        The option is not supported by the protocol.
    [ENOTSOCK]
        The socket argument does not refer to a socket.

    The getsockopt() function may fail if:

    [EACCES]
        The calling process does not have appropriate privileges.
    [EINVAL]
        The socket has been shut down.
    [ENOBUFS]
        Insufficient resources are available in the system to complete the function.


*** NAME:

    getsubopt - parse suboption arguments from a string

SYNOPSIS

    [CX] [Option Start] #include <stdlib.h>

    int getsubopt(char **optionp, char * const *keylistp, char **valuep); [Option End]

DESCRIPTION

    The getsubopt() function shall parse suboption arguments in a flag argument. Such options often result from the use of getopt().

    The getsubopt() argument optionp is a pointer to a pointer to the option argument string. The suboption arguments shall be separated by <comma> characters and each may consist of either a single token, or a token-value pair separated by an <equals-sign>.

    The keylistp argument shall be a pointer to a vector of strings. The end of the vector is identified by a null pointer. Each entry in the vector is one of the possible tokens that might be found in *optionp. Since <comma> characters delimit suboption arguments in optionp, they should not appear in any of the strings pointed to by keylistp. Similarly, because an <equals-sign> separates a token from its value, the application should not include an <equals-sign> in any of the strings pointed to by keylistp. The getsubopt() function shall not modify the keylistp vector.

    The valuep argument is the address of a value string pointer.

    If a <comma> appears in optionp, it shall be interpreted as a suboption separator. After <comma> characters have been processed, if there are one or more <equals-sign> characters in a suboption string, the first <equals-sign> in any suboption string shall be interpreted as a separator between a token and a value. Subsequent <equals-sign> characters in a suboption string shall be interpreted as part of the value.

    If the string at *optionp contains only one suboption argument (equivalently, no <comma> characters), getsubopt() shall update *optionp to point to the null character at the end of the string. Otherwise, it shall isolate the suboption argument by replacing the <comma> separator with a null character, and shall update *optionp to point to the start of the next suboption argument. If the suboption argument has an associated value (equivalently, contains an <equals-sign>), getsubopt() shall update *valuep to point to the value's first character. Otherwise, it shall set *valuep to a null pointer. The calling application may use this information to determine whether the presence or absence of a value for the suboption is an error.

    Additionally, when getsubopt() fails to match the suboption argument with a token in the keylistp array, the calling application should decide if this is an error, or if the unrecognized option should be processed in another way.

RETURN VALUE

    The getsubopt() function shall return the index of the matched token string, or -1 if no token strings were matched.

ERRORS

    No errors are defined.

The following sections are informative.
EXAMPLES

    Parsing Suboptions

    The following example uses the getsubopt() function to parse a value argument in the optarg external variable returned by a call to getopt().

    #include <stdio.h>
    #include <stdlib.h>
    #include <unistd.h>


    int do_all;
    const char *type;
    int read_size;
    int write_size;
    int read_only;


    enum
    {
        RO_OPTION = 0,
        RW_OPTION,
        READ_SIZE_OPTION,
        WRITE_SIZE_OPTION
    };


    const char *mount_opts[] =
    {
        [RO_OPTION] = "ro",
        [RW_OPTION] = "rw",
        [READ_SIZE_OPTION] = "rsize",
        [WRITE_SIZE_OPTION] = "wsize",
        NULL
    };


    int
    main(int argc, char *argv[])
    {
        char *subopts, *value;
        int opt;


        while ((opt = getopt(argc, argv, "at:o:")) != -1)
            switch(opt)
                {
                case 'a':
                    do_all = 1;
                    break;
                case 't':
                    type = optarg;
                    break;
                case 'o':
                    subopts = optarg;
                    while (*subopts != ' ')
                    {
                        char *saved = subopts;
                        switch(getsubopt(&subopts, (char **)mount_opts,
                            &value))
                        {
                        case RO_OPTION:
                            read_only = 1;
                            break;
                        case RW_OPTION:
                            read_only = 0;
                            break;
                        case READ_SIZE_OPTION:
                            if (value == NULL)
                                abort();
                            read_size = atoi(value);
                            break;
                        case WRITE_SIZE_OPTION:
                            if (value == NULL)
                                abort();
                            write_size = atoi(value);
                            break;
                        default:
                            // Unknown suboption. //
                            printf("Unknown suboption `%s'\n", saved);
                            abort();
                        }
                    }
                    break;
                default:
                    abort();
                }


        // Do the real work. //


        return 0;
    }

    If the above example is invoked with:

    program -o ro,rsize=512

    then after option parsing, the variable do_all will be 0, type will be a null pointer, read_size will be 512, write_size will be 0, and read_only will be 1. If it is invoked with:

    program -o oops

    it will print:

    "Unknown suboption `oops'"

    before aborting.

APPLICATION USAGE

    The value of *valuep when getsubopt() returns -1 is unspecified. Historical implementations provide various incompatible extensions to allow an application to access the suboption text that was not found in the keylistp array.

RATIONALE

    The keylistp argument of getsubopt() is typed as char * const * to match historical practice. However, the standard is clear that implementations will not modify either the array or the strings contained in the array, as if the argument had been typed const char * const *.




*** NAME:

    getuid - get a real user ID

SYNOPSIS

    #include <unistd.h>

    uid_t getuid(void);

DESCRIPTION

    The getuid() function shall return the real user ID of the calling process. The getuid() function shall not modify errno.

RETURN VALUE

    The getuid() function shall always be successful and no return value is reserved to indicate the error.

ERRORS

    No errors are defined.

The following sections are informative.
EXAMPLES

    Setting the Effective User ID to the Real User ID

    The following example sets the effective user ID of the calling process to the real user ID.

    #include <unistd.h>
    ...
    seteuid(getuid());

APPLICATION USAGE

    None.

RATIONALE

    In a conforming environment, getuid() will always succeed. It is possible for implementations to provide an extension where a process in a non-conforming environment will not be associated with a user or group ID. It is recommended that such implementations return (uid_t)-1 and set errno to indicate such an environment; doing so does not violate this standard, since such an environment is already an extension.

FUTURE DIRECTIONS

    None.

SEE ALSO

    getegid, geteuid, getgid, setegid, seteuid, setgid, setregid, setreuid, setuid










*** NAME:

    accept - accept a new connection on a socket

SYNOPSIS

    #include <sys/socket.h>

    int accept(int socket, struct sockaddr *restrict address,
           socklen_t *restrict address_len);

DESCRIPTION

    The accept() function shall extract the first connection on the queue of pending connections, create a new socket with the same socket type protocol and address family as the specified socket, and allocate a new file descriptor for that socket. The file descriptor shall be allocated as described in File Descriptor Allocation.

    The accept() function takes the following arguments:

    socket
        Specifies a socket that was created with socket(), has been bound to an address with bind(), and has issued a successful call to listen().
    address
        Either a null pointer, or a pointer to a sockaddr structure where the address of the connecting socket shall be returned.
    address_len
        Either a null pointer, if address is a null pointer, or a pointer to a socklen_t object which on input specifies the length of the supplied sockaddr structure, and on output specifies the length of the stored address.

    If address is not a null pointer, the address of the peer for the accepted connection shall be stored in the sockaddr structure pointed to by address, and the length of this address shall be stored in the object pointed to by address_len.

    If the actual length of the address is greater than the length of the supplied sockaddr structure, the stored address shall be truncated.

    If the protocol permits connections by unbound clients, and the peer is not bound, then the value stored in the object pointed to by address is unspecified.

    If the listen queue is empty of connection requests and O_NONBLOCK is not set on the file descriptor for the socket, accept() shall block until a connection is present. If the listen() queue is empty of connection requests and O_NONBLOCK is set on the file descriptor for the socket, accept() shall fail and set errno to [EAGAIN] or [EWOULDBLOCK].

    The accepted socket cannot itself accept more connections. The original socket remains open and can accept more connections.

RETURN VALUE

    Upon successful completion, accept() shall return the non-negative file descriptor of the accepted socket. Otherwise, -1 shall be returned, errno shall be set to indicate the error, and any object pointed to by address_len shall remain unchanged.

ERRORS

    The accept() function shall fail if:

    [EAGAIN] or [EWOULDBLOCK]
        O_NONBLOCK is set for the socket file descriptor and no connections are present to be accepted.
    [EBADF]
        The socket argument is not a valid file descriptor.
    [ECONNABORTED]
        A connection has been aborted.
    [EINTR]
        The accept() function was interrupted by a signal that was caught before a valid connection arrived.
    [EINVAL]
        The socket is not accepting connections.
    [EMFILE]
        All file descriptors available to the process are currently open.
    [ENFILE]
        The maximum number of file descriptors in the system are already open.
    [ENOBUFS]
        No buffer space is available.
    [ENOMEM]
        There was insufficient memory available to complete the operation.
    [ENOTSOCK]
        The socket argument does not refer to a socket.
    [EOPNOTSUPP]
        The socket type of the specified socket does not support accepting connections.

    The accept() function may fail if:

    [EPROTO]
        A protocol error has occurred; [OB XSR] [Option Start]  for example, the STREAMS protocol stack has not been initialized. [Option End]

The following sections are informative.
EXAMPLES

    None.

APPLICATION USAGE

    When a connection is available, select() indicates that the file descriptor for the socket is ready for reading.

RATIONALE

    None.

FUTURE DIRECTIONS

    None.

SEE ALSO

    File Descriptor Allocation, bind, connect, listen, socket




*** NAME:

    htonl, htons, ntohl, ntohs - convert values between host and network byte order

SYNOPSIS

    #include <arpa/inet.h>

    uint32_t htonl(uint32_t hostlong);
    uint16_t htons(uint16_t hostshort);
    uint32_t ntohl(uint32_t netlong);
    uint16_t ntohs(uint16_t netshort);

DESCRIPTION

    These functions shall convert 16-bit and 32-bit quantities between network byte order and host byte order.

    On some implementations, these functions are defined as macros.

    The uint32_t and uint16_t types are defined in <inttypes.h>.

RETURN VALUE

    The htonl() and htons() functions shall return the argument value converted from host to network byte order.

    The ntohl() and ntohs() functions shall return the argument value converted from network to host byte order.


*** NAME

    getsockname - get the socket name

SYNOPSIS

    #include <sys/socket.h>

    int getsockname(int socket, struct sockaddr *restrict address,
           socklen_t *restrict address_len);

DESCRIPTION

    The getsockname() function shall retrieve the locally-bound name of the specified socket, store this address in the sockaddr structure pointed to by the address argument, and store the length of this address in the object pointed to by the address_len argument.

    The address_len argument points to a socklen_t object which on input specifies the length of the supplied sockaddr structure, and on output specifies the length of the stored address. If the actual length of the address is greater than the length of the supplied sockaddr structure, the stored address shall be truncated.

    If the socket has not been bound to a local name, the value stored in the object pointed to by address is unspecified.

RETURN VALUE

    Upon successful completion, 0 shall be returned, the address argument shall point to the address of the socket, and the address_len argument shall point to the length of the address. Otherwise, -1 shall be returned and errno set to indicate the error.

ERRORS

    The getsockname() function shall fail if:

    [EBADF]
        The socket argument is not a valid file descriptor.
    [ENOTSOCK]
        The socket argument does not refer to a socket.
    [EOPNOTSUPP]
        The operation is not supported for this socket's protocol.

    The getsockname() function may fail if:

    [EINVAL]
        The socket has been shut down.
    [ENOBUFS]
        Insufficient resources were available in the system to complete the function.


*** NAME

    getpeername - get the name of the peer socket

SYNOPSIS

    #include <sys/socket.h>

    int getpeername(int socket, struct sockaddr *restrict address,
           socklen_t *restrict address_len);

DESCRIPTION

    The getpeername() function shall retrieve the peer address of the specified socket, store this address in the sockaddr structure pointed to by the address argument, and store the length of this address in the object pointed to by the address_len argument.

    The address_len argument points to a socklen_t object which on input specifies the length of the supplied sockaddr structure, and on output specifies the length of the stored address. If the actual length of the address is greater than the length of the supplied sockaddr structure, the stored address shall be truncated.

    If the protocol permits connections by unbound clients, and the peer is not bound, then the value stored in the object pointed to by address is unspecified.

RETURN VALUE

    Upon successful completion, 0 shall be returned. Otherwise, -1 shall be returned and errno set to indicate the error.

ERRORS

    The getpeername() function shall fail if:

    [EBADF]
        The socket argument is not a valid file descriptor.
    [EINVAL]
        The socket has been shut down.
    [ENOTCONN]
        The socket is not connected or otherwise has not had the peer pre-specified.
    [ENOTSOCK]
        The socket argument does not refer to a socket.
    [EOPNOTSUPP]
        The operation is not supported for the socket protocol.

    The getpeername() function may fail if:

    [ENOBUFS]
        Insufficient resources were available in the system to complete the call.


*** NAME

    connect - connect a socket

SYNOPSIS

    #include <sys/socket.h>

    int connect(int socket, const struct sockaddr *address,
           socklen_t address_len);

DESCRIPTION

    The connect() function shall attempt to make a connection on a connection-mode socket or to set or reset the peer address of a connectionless-mode socket. The function takes the following arguments:

    socket
        Specifies the file descriptor associated with the socket.
    address
        Points to a sockaddr structure containing the peer address. The length and format of the address depend on the address family of the socket.
    address_len
        Specifies the length of the sockaddr structure pointed to by the address argument.

    If the socket has not already been bound to a local address, connect() shall bind it to an address which, unless the socket's address family is AF_UNIX, is an unused local address.

    If the initiating socket is not connection-mode, then connect() shall set the socket's peer address, and no connection is made. For SOCK_DGRAM sockets, the peer address identifies where all datagrams are sent on subsequent send() functions, and limits the remote sender for subsequent recv() functions. If the sa_family member of address is AF_UNSPEC, the socket's peer address shall be reset. Note that despite no connection being made, the term ``connected'' is used to describe a connectionless-mode socket for which a peer address has been set.

    If the initiating socket is connection-mode, then connect() shall attempt to establish a connection to the address specified by the address argument. If the connection cannot be established immediately and O_NONBLOCK is not set for the file descriptor for the socket, connect() shall block for up to an unspecified timeout interval until the connection is established. If the timeout interval expires before the connection is established, connect() shall fail and the connection attempt shall be aborted. If connect() is interrupted by a signal that is caught while blocked waiting to establish a connection, connect() shall fail and set errno to [EINTR], but the connection request shall not be aborted, and the connection shall be established asynchronously.

    If the connection cannot be established immediately and O_NONBLOCK is set for the file descriptor for the socket, connect() shall fail and set errno to [EINPROGRESS], but the connection request shall not be aborted, and the connection shall be established asynchronously. Subsequent calls to connect() for the same socket, before the connection is established, shall fail and set errno to [EALREADY].

    When the connection has been established asynchronously, pselect(), select(), and poll() shall indicate that the file descriptor for the socket is ready for writing.

    The socket in use may require the process to have appropriate privileges to use the connect() function.

RETURN VALUE

    Upon successful completion, connect() shall return 0; otherwise, -1 shall be returned and errno set to indicate the error.

ERRORS

    The connect() function shall fail if:

    [EADDRNOTAVAIL]
        The specified address is not available from the local machine.
    [EAFNOSUPPORT]
        The specified address is not a valid address for the address family of the specified socket.
    [EALREADY]
        A connection request is already in progress for the specified socket.
    [EBADF]
        The socket argument is not a valid file descriptor.
    [ECONNREFUSED]
        The target address was not listening for connections or refused the connection request.
    [EINPROGRESS]
        O_NONBLOCK is set for the file descriptor for the socket and the connection cannot be immediately established; the connection shall be established asynchronously.
    [EINTR]
        The attempt to establish a connection was interrupted by delivery of a signal that was caught; the connection shall be established asynchronously.
    [EISCONN]
        The specified socket is connection-mode and is already connected.
    [ENETUNREACH]
        No route to the network is present.
    [ENOTSOCK]
        The socket argument does not refer to a socket.
    [EPROTOTYPE]
        The specified address has a different type than the socket bound to the specified peer address.
    [ETIMEDOUT]
        The attempt to connect timed out before a connection was made.

    If the address family of the socket is AF_UNIX, then connect() shall fail if:

    [EIO]
        An I/O error occurred while reading from or writing to the file system.
    [ELOOP]
        A loop exists in symbolic links encountered during resolution of the pathname in address.
    [ENAMETOOLONG]
        The length of a component of a pathname is longer than {NAME_MAX}.
    [ENOENT]
        A component of the pathname does not name an existing file or the pathname is an empty string.
    [ENOTDIR]
        A component of the path prefix of the pathname in address names an existing file that is neither a directory nor a symbolic link to a directory, or the pathname in address contains at least one non- <slash> character and ends with one or more trailing <slash> characters and the last pathname component names an existing file that is neither a directory nor a symbolic link to a directory.

    The connect() function may fail if:

    [EACCES]
        Search permission is denied for a component of the path prefix; or write access to the named socket is denied.
    [EADDRINUSE]
        Attempt to establish a connection that uses addresses that are already in use.
    [ECONNRESET]
        Remote host reset the connection request.
    [EHOSTUNREACH]
        The destination host cannot be reached (probably because the host is down or a remote router cannot reach it).
    [EINVAL]
        The address_len argument is not a valid length for the address family; or invalid address family in the sockaddr structure.
    [ELOOP]
        More than {SYMLOOP_MAX} symbolic links were encountered during resolution of the pathname in address.
    [ENAMETOOLONG]
        The length of a pathname exceeds {PATH_MAX}, or pathname resolution of a symbolic link produced an intermediate result with a length that exceeds {PATH_MAX}.
    [ENETDOWN]
        The local network interface used to reach the destination is down.
    [ENOBUFS]
        No buffer space is available.
    [EOPNOTSUPP]
        The socket is listening and cannot be connected.

The following sections are informative.
EXAMPLES

    None.

APPLICATION USAGE

    If connect() fails, the state of the socket is unspecified. Conforming applications should close the file descriptor and create a new socket before attempting to reconnect.

RATIONALE

    None.

FUTURE DIRECTIONS

    None.

SEE ALSO

    accept, bind, close, getsockname, poll, pselect, send, shutdown, socket




*** NAME

    inet_ntop, inet_pton - convert IPv4 and IPv6 addresses between binary and text form

SYNOPSIS

    #include <arpa/inet.h>

    const char *inet_ntop(int af, const void *restrict src,
           char *restrict dst, socklen_t size);
    int inet_pton(int af, const char *restrict src, void *restrict dst);

DESCRIPTION

    The inet_ntop() function shall convert a numeric address into a text string suitable for presentation. The af argument shall specify the family of the address. This can be AF_INET [IP6] [Option Start]  or AF_INET6. [Option End] The src argument points to a buffer holding an IPv4 address if the af argument is AF_INET, [IP6] [Option Start]  or an IPv6 address if the af argument is AF_INET6; [Option End] the address must be in network byte order. The dst argument points to a buffer where the function stores the resulting text string; it shall not be NULL. The size argument specifies the size of this buffer, which shall be large enough to hold the text string (INET_ADDRSTRLEN characters for IPv4, [IP6] [Option Start]  INET6_ADDRSTRLEN characters for IPv6). [Option End]

    The inet_pton() function shall convert an address in its standard text presentation form into its numeric binary form. The af argument shall specify the family of the address. The AF_INET [IP6] [Option Start]  and AF_INET6 [Option End] address families shall be supported. The src argument points to the string being passed in. The dst argument points to a buffer into which the function stores the numeric address; this shall be large enough to hold the numeric address (32 bits for AF_INET, [IP6] [Option Start]  128 bits for AF_INET6). [Option End]

    If the af argument of inet_pton() is AF_INET, the src string shall be in the standard IPv4 dotted-decimal form:

    ddd.ddd.ddd.ddd

    where "ddd" is a one to three digit decimal number between 0 and 255 (see inet_addr). The inet_pton() function does not accept other formats (such as the octal numbers, hexadecimal numbers, and fewer than four numbers that inet_addr() accepts).

    [IP6] [Option Start] If the af argument of inet_pton() is AF_INET6, the src string shall be in one of the following standard IPv6 text forms:

        The preferred form is "x:x:x:x:x:x:x:x", where the 'x' s are the hexadecimal values of the eight 16-bit pieces of the address. Leading zeros in individual fields can be omitted, but there shall be one to four hexadecimal digits in every field.

        A string of contiguous zero fields in the preferred form can be shown as "::". The "::" can only appear once in an address. Unspecified addresses ( "0:0:0:0:0:0:0:0" ) may be represented simply as "::".

        A third form that is sometimes more convenient when dealing with a mixed environment of IPv4 and IPv6 nodes is "x:x:x:x:x:x:d.d.d.d", where the 'x' s are the hexadecimal values of the six high-order 16-bit pieces of the address, and the 'd' s are the decimal values of the four low-order 8-bit pieces of the address (standard IPv4 representation).

    Note:
        A more extensive description of the standard representations of IPv6 addresses can be found in RFC 2373.

    [Option End]

RETURN VALUE

    The inet_ntop() function shall return a pointer to the buffer containing the text string if the conversion succeeds, and NULL otherwise, and set errno to indicate the error.

    The inet_pton() function shall return 1 if the conversion succeeds, with the address pointed to by dst in network byte order. It shall return 0 if the input is not a valid IPv4 dotted-decimal string [IP6] [Option Start]  or a valid IPv6 address string, [Option End] or -1 with errno set to [EAFNOSUPPORT] if the af argument is unknown.

ERRORS

    The inet_ntop() and inet_pton() functions shall fail if:

    [EAFNOSUPPORT]
        The af argument is invalid.
    [ENOSPC]
        The size of the inet_ntop() result buffer is inadequate.



*** NAME

    inet_addr, inet_ntoa - IPv4 address manipulation

SYNOPSIS

    #include <arpa/inet.h>

    in_addr_t inet_addr(const char *cp);
    char *inet_ntoa(struct in_addr in);

DESCRIPTION

    The inet_addr() function shall convert the string pointed to by cp, in the standard IPv4 dotted decimal notation, to an integer value suitable for use as an Internet address.

    The inet_ntoa() function shall convert the Internet host address specified by in to a string in the Internet standard dot notation.

    The inet_ntoa() function need not be thread-safe.

    All Internet addresses shall be returned in network order (bytes ordered from left to right).

    Values specified using IPv4 dotted decimal notation take one of the following forms:

    a.b.c.d
        When four parts are specified, each shall be interpreted as a byte of data and assigned, from left to right, to the four bytes of an Internet address.
    a.b.c
        When a three-part address is specified, the last part shall be interpreted as a 16-bit quantity and placed in the rightmost two bytes of the network address. This makes the three-part address format convenient for specifying Class B network addresses as "128.net.host".
    a.b
        When a two-part address is supplied, the last part shall be interpreted as a 24-bit quantity and placed in the rightmost three bytes of the network address. This makes the two-part address format convenient for specifying Class A network addresses as "net.host".
    a
        When only one part is given, the value shall be stored directly in the network address without any byte rearrangement.

    All numbers supplied as parts in IPv4 dotted decimal notation may be decimal, octal, or hexadecimal, as specified in the ISO C standard (that is, a leading 0x or 0X implies hexadecimal; otherwise, a leading '0' implies octal; otherwise, the number is interpreted as decimal).

RETURN VALUE

    Upon successful completion, inet_addr() shall return the Internet address. Otherwise, it shall return ( in_addr_t)(-1).

    The inet_ntoa() function shall return a pointer to the network address in Internet standard dot notation.

ERRORS

    No errors are defined.

The following sections are informative.
EXAMPLES

    None.

APPLICATION USAGE

    The return value of inet_ntoa() may point to static data that may be overwritten by subsequent calls to inet_ntoa().

RATIONALE

    None.

FUTURE DIRECTIONS

    None.

SEE ALSO

    endhostent, endnetent



*** NAME

    socket - create an endpoint for communication

SYNOPSIS

    #include <sys/socket.h>

    int socket(int domain, int type, int protocol);

DESCRIPTION

    The socket() function shall create an unbound socket in a communications domain, and return a file descriptor that can be used in later function calls that operate on sockets. The file descriptor shall be allocated as described in File Descriptor Allocation.

    The socket() function takes the following arguments:

    domain
        Specifies the communications domain in which a socket is to be created.
    type
        Specifies the type of socket to be created.
    protocol
        Specifies a particular protocol to be used with the socket. Specifying a protocol of 0 causes socket() to use an unspecified default protocol appropriate for the requested socket type.

    The domain argument specifies the address family used in the communications domain. The address families supported by the system are implementation-defined.

    Symbolic constants that can be used for the domain argument are defined in the <sys/socket.h> header.

    The type argument specifies the socket type, which determines the semantics of communication over the socket. The following socket types are defined; implementations may specify additional socket types:

    SOCK_STREAM
        Provides sequenced, reliable, bidirectional, connection-mode byte streams, and may provide a transmission mechanism for out-of-band data.
    SOCK_DGRAM
        Provides datagrams, which are connectionless-mode, unreliable messages of fixed maximum length.
    SOCK_SEQPACKET
        Provides sequenced, reliable, bidirectional, connection-mode transmission paths for records. A record can be sent using one or more output operations and received using one or more input operations, but a single operation never transfers part of more than one record. Record boundaries are visible to the receiver via the MSG_EOR flag.

    If the protocol argument is non-zero, it shall specify a protocol that is supported by the address family. If the protocol argument is zero, the default protocol for this address family and type shall be used. The protocols supported by the system are implementation-defined.

    The process may need to have appropriate privileges to use the socket() function or to create some sockets.

RETURN VALUE

    Upon successful completion, socket() shall return a non-negative integer, the socket file descriptor. Otherwise, a value of -1 shall be returned and errno set to indicate the error.

ERRORS

    The socket() function shall fail if:

    [EAFNOSUPPORT]
        The implementation does not support the specified address family.
    [EMFILE]
        All file descriptors available to the process are currently open.
    [ENFILE]
        No more file descriptors are available for the system.
    [EPROTONOSUPPORT]
        The protocol is not supported by the address family, or the protocol is not supported by the implementation.
    [EPROTOTYPE]
        The socket type is not supported by the protocol.

    The socket() function may fail if:

    [EACCES]
        The process does not have appropriate privileges.
    [ENOBUFS]
        Insufficient resources were available in the system to perform the operation.
    [ENOMEM]
        Insufficient memory was available to fulfill the request.

The following sections are informative.
EXAMPLES

    None.

APPLICATION USAGE

    The documentation for specific address families specifies which protocols each address family supports. The documentation for specific protocols specifies which socket types each protocol supports.

    The application can determine whether an address family is supported by trying to create a socket with domain set to the protocol in question.

RATIONALE

    None.

FUTURE DIRECTIONS

    None.

SEE ALSO

    File Descriptor Allocation, accept, bind, connect, getsockname, getsockopt, listen, recv, recvfrom, recvmsg, send, sendmsg, setsockopt, shutdown, socketpair



*** NAME

    sys/socket.h - main sockets header

SYNOPSIS

    #include <sys/socket.h>

DESCRIPTION

    The <sys/socket.h> header shall define the socklen_t type, which is an integer type of width of at least 32 bits; see APPLICATION USAGE.

    The <sys/socket.h> header shall define the sa_family_t unsigned integer type.

    The <sys/socket.h> header shall define the sockaddr structure, which shall include at least the following members:

    sa_family_t  sa_family  Address family. 
    char         sa_data[]  Socket address (variable-length data). 

    The sockaddr structure is used to define a socket address which is used in the bind(), connect(), getpeername(), getsockname(), recvfrom(), and sendto() functions.

    The <sys/socket.h> header shall define the sockaddr_storage structure, which shall be:

        Large enough to accommodate all supported protocol-specific address structures

        Aligned at an appropriate boundary so that pointers to it can be cast as pointers to protocol-specific address structures and used to access the fields of those structures without alignment problems

    The sockaddr_storage structure shall include at least the following members:

    sa_family_t   ss_family

    When a pointer to a sockaddr_storage structure is cast as a pointer to a sockaddr structure, the ss_family field of the sockaddr_storage structure shall map onto the sa_family field of the sockaddr structure. When a pointer to a sockaddr_storage structure is cast as a pointer to a protocol-specific address structure, the ss_family field shall map onto a field of that structure that is of type sa_family_t and that identifies the protocol's address family.

    The <sys/socket.h> header shall define the msghdr structure, which shall include at least the following members:

    void          *msg_name        Optional address. 
    socklen_t      msg_namelen     Size of address. 
    struct iovec  *msg_iov         Scatter/gather array. 
    int            msg_iovlen      Members in msg_iov. 
    void          *msg_control     Ancillary data; see below. 
    socklen_t      msg_controllen  Ancillary data buffer len. 
    int            msg_flags       Flags on received message. 

    The msghdr structure is used to minimize the number of directly supplied parameters to the recvmsg() and sendmsg() functions. This structure is used as a value- result parameter in the recvmsg() function and value only for the sendmsg() function.

    The <sys/socket.h> header shall define the iovec structure as described in <sys/uio.h>.

    The <sys/socket.h> header shall define the cmsghdr structure, which shall include at least the following members:

    socklen_t  cmsg_len    Data byte count, including the cmsghdr. 
    int        cmsg_level  Originating protocol. 
    int        cmsg_type   Protocol-specific type. 

    The cmsghdr structure is used for storage of ancillary data object information.

    Ancillary data consists of a sequence of pairs, each consisting of a cmsghdr structure followed by a data array. The data array contains the ancillary data message, and the cmsghdr structure contains descriptive information that allows an application to correctly parse the data.

    The values for cmsg_level shall be legal values for the level argument to the getsockopt() and setsockopt() functions. The system documentation shall specify the cmsg_type definitions for the supported protocols.

    Ancillary data is also possible at the socket level. The <sys/socket.h> header shall define the following symbolic constant for use as the cmsg_type value when cmsg_level is SOL_SOCKET:

    SCM_RIGHTS
        Indicates that the data array contains the access rights to be sent or received.

    The <sys/socket.h> header shall define the following macros to gain access to the data arrays in the ancillary data associated with a message header:

    CMSG_DATA(cmsg)
        If the argument is a pointer to a cmsghdr structure, this macro shall return an unsigned character pointer to the data array associated with the cmsghdr structure.
    CMSG_NXTHDR(mhdr,cmsg)
        If the first argument is a pointer to a msghdr structure and the second argument is a pointer to a cmsghdr structure in the ancillary data pointed to by the msg_control field of that msghdr structure, this macro shall return a pointer to the next cmsghdr structure, or a null pointer if this structure is the last cmsghdr in the ancillary data.
    CMSG_FIRSTHDR(mhdr)
        If the argument is a pointer to a msghdr structure, this macro shall return a pointer to the first cmsghdr structure in the ancillary data associated with this msghdr structure, or a null pointer if there is no ancillary data associated with the msghdr structure.

    The <sys/socket.h> header shall define the linger structure, which shall include at least the following members:

    int  l_onoff   Indicates whether linger option is enabled. 
    int  l_linger  Linger time, in seconds. 

    The <sys/socket.h> header shall define the following symbolic constants with distinct values:

    SOCK_DGRAM
        Datagram socket.
    SOCK_RAW
        [RS] [Option Start] Raw Protocol Interface. [Option End]
    SOCK_SEQPACKET
        Sequenced-packet socket.
    SOCK_STREAM
        Byte-stream socket.

    The <sys/socket.h> header shall define the following symbolic constant for use as the level argument of setsockopt() and getsockopt().

    SOL_SOCKET
        Options to be accessed at socket level, not protocol level.

    The <sys/socket.h> header shall define the following symbolic constants with distinct values for use as the option_name argument in getsockopt() or setsockopt() calls (see XSH Use of Options):

    SO_ACCEPTCONN
        Socket is accepting connections.
    SO_BROADCAST
        Transmission of broadcast messages is supported.
    SO_DEBUG
        Debugging information is being recorded.
    SO_DONTROUTE
        Bypass normal routing.
    SO_ERROR
        Socket error status.
    SO_KEEPALIVE
        Connections are kept alive with periodic messages.
    SO_LINGER
        Socket lingers on close.
    SO_OOBINLINE
        Out-of-band data is transmitted in line.
    SO_RCVBUF
        Receive buffer size.
    SO_RCVLOWAT
        Receive ``low water mark''.
    SO_RCVTIMEO
        Receive timeout.
    SO_REUSEADDR
        Reuse of local addresses is supported.
    SO_SNDBUF
        Send buffer size.
    SO_SNDLOWAT
        Send ``low water mark''.
    SO_SNDTIMEO
        Send timeout.
    SO_TYPE
        Socket type.

    The <sys/socket.h> header shall define the following symbolic constant for use as the maximum backlog queue length which may be specified by the backlog field of the listen() function:

    SOMAXCONN
        The maximum backlog queue length.

    The <sys/socket.h> header shall define the following symbolic constants with distinct values for use as the valid values for the msg_flags field in the msghdr structure, or the flags parameter in recv(), recvfrom(), recvmsg(), send(), sendmsg(), or sendto() calls:

    MSG_CTRUNC
        Control data truncated.
    MSG_DONTROUTE
        Send without using routing tables.
    MSG_EOR
        Terminates a record (if supported by the protocol).
    MSG_OOB
        Out-of-band data.
    MSG_NOSIGNAL
        No SIGPIPE generated when an attempt to send is made on a stream-oriented socket that is no longer connected.
    MSG_PEEK
        Leave received data in queue.
    MSG_TRUNC
        Normal data truncated.
    MSG_WAITALL
        Attempt to fill the read buffer.

    The <sys/socket.h> header shall define the following symbolic constants with distinct values:

    AF_INET
        Internet domain sockets for use with IPv4 addresses.
    AF_INET6
        [IP6] [Option Start] Internet domain sockets for use with IPv6 addresses. [Option End]
    AF_UNIX
        UNIX domain sockets.
    AF_UNSPEC
        Unspecified.

    The value of AF_UNSPEC shall be 0.

    The <sys/socket.h> header shall define the following symbolic constants with distinct values:

    SHUT_RD
        Disables further receive operations.
    SHUT_RDWR
        Disables further send and receive operations.
    SHUT_WR
        Disables further send operations.

    The <sys/socket.h> header shall define the size_t and ssize_t types as described in <sys/types.h>.

    The following shall be declared as functions and may also be defined as macros. Function prototypes shall be provided.

    int     accept(int, struct sockaddr *restrict, socklen_t *restrict);
    int     bind(int, const struct sockaddr *, socklen_t);
    int     connect(int, const struct sockaddr *, socklen_t);
    int     getpeername(int, struct sockaddr *restrict, socklen_t *restrict);
    int     getsockname(int, struct sockaddr *restrict, socklen_t *restrict);
    int     getsockopt(int, int, int, void *restrict, socklen_t *restrict);
    int     listen(int, int);
    ssize_t recv(int, void *, size_t, int);
    ssize_t recvfrom(int, void *restrict, size_t, int,
            struct sockaddr *restrict, socklen_t *restrict);
    ssize_t recvmsg(int, struct msghdr *, int);
    ssize_t send(int, const void *, size_t, int);
    ssize_t sendmsg(int, const struct msghdr *, int);
    ssize_t sendto(int, const void *, size_t, int, const struct sockaddr *,
            socklen_t);
    int     setsockopt(int, int, int, const void *, socklen_t);
    int     shutdown(int, int);
    int     sockatmark(int);
    int     socket(int, int, int);
    int     socketpair(int, int, int, int [2]);

    Inclusion of <sys/socket.h> may also make visible all symbols from <sys/uio.h>.

The following sections are informative.
APPLICATION USAGE

    To forestall portability problems, it is recommended that applications not use values larger than 231 -1 for the socklen_t type.

    The sockaddr_storage structure solves the problem of declaring storage for automatic variables which is both large enough and aligned enough for storing the socket address data structure of any family. For example, code with a file descriptor and without the context of the address family can pass a pointer to a variable of this type, where a pointer to a socket address structure is expected in calls such as getpeername(), and determine the address family by accessing the received content after the call.

    The example below illustrates a data structure which aligns on a 64-bit boundary. An implementation-defined field _ss_align following _ss_pad1 is used to force a 64-bit alignment which covers proper alignment good enough for needs of at least sockaddr_in6 (IPv6) and sockaddr_in (IPv4) address data structures. The size of padding field _ss_pad1 depends on the chosen alignment boundary. The size of padding field _ss_pad2 depends on the value of overall size chosen for the total size of the structure. This size and alignment are represented in the above example by implementation-defined (not required) constants _SS_MAXSIZE (chosen value 128) and _SS_ALIGNMENT (with chosen value 8). Constants _SS_PAD1SIZE (derived value 6) and _SS_PAD2SIZE (derived value 112) are also for illustration and not required. The implementation-defined definitions and structure field names above start with an <underscore> to denote implementation private name space. Portable code is not expected to access or reference those fields or constants.

    //
    //  Desired design of maximum size and alignment.
    //
    #define _SS_MAXSIZE 128
        // Implementation-defined maximum size. //
    #define _SS_ALIGNSIZE (sizeof(int64_t))
        // Implementation-defined desired alignment. //


    //
    //  Definitions used for sockaddr_storage structure paddings design.
    // 
    #define _SS_PAD1SIZE (_SS_ALIGNSIZE - sizeof(sa_family_t))
    #define _SS_PAD2SIZE (_SS_MAXSIZE - (sizeof(sa_family_t)+ \
                          _SS_PAD1SIZE + _SS_ALIGNSIZE))
    struct sockaddr_storage {
        sa_family_t  ss_family;  // Address family. //
    //
    //  Following fields are implementation-defined.
    // 
        char _ss_pad1[_SS_PAD1SIZE];
            // 6-byte pad; this is to make implementation-defined
            // pad up to alignment field that follows explicit in
            // the data structure. //
        int64_t _ss_align;  // Field to force desired structure
                            // storage alignment. //
        char _ss_pad2[_SS_PAD2SIZE];
            // 112-byte pad to achieve desired size,
            // _SS_MAXSIZE value minus size of ss_family
            // __ss_pad1, __ss_align fields is 112. //
    };

RATIONALE

    None.

FUTURE DIRECTIONS

    None.

SEE ALSO

    <sys/types.h>, <sys/uio.h>

    XSH accept, bind, connect, getpeername, getsockname, getsockopt, listen, recv, recvfrom, recvmsg, send, sendmsg, sendto, setsockopt, shutdown, sockatmark, socket, socketpair




*/
