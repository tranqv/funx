#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


void  c_stat_ ( 
      char        *path, 
      dev_t       *st_dev, 
      ino_t       *st_ino, 
      mode_t      *st_mode, 
	   nlink_t     *st_nlink, 
      uid_t       *st_uid, 
      gid_t       *st_gid, 
      dev_t       *st_rdev,
	   off_t       *st_size, 
      time_t      *st_atimes, 
      time_t      *st_mtimes,
	   time_t      *st_ctimes, 
      blksize_t   *st_blksize,
      blkcnt_t    *st_blocks
)
{
   struct stat tmp ;

// If we want to get info of absolute path, e.g. root of slink, do:
// stat ( path, &tmp ) ;

// If we want to get info of symlink, instead of its root, do: 
   fstatat ( AT_FDCWD, path, &tmp, AT_SYMLINK_NOFOLLOW ) ;  

//

   *st_dev       = tmp.st_dev ;
   *st_ino       = tmp.st_ino ;
   *st_mode      = tmp.st_mode ;
   *st_nlink     = tmp.st_nlink ;
   *st_uid       = tmp.st_uid ;
   *st_gid       = tmp.st_gid ;
   *st_rdev      = tmp.st_rdev ;
   *st_size      = tmp.st_size ;
   *st_atimes    = tmp.st_atime ;
   *st_mtimes    = tmp.st_mtime ;
   *st_ctimes    = tmp.st_ctime ;
   *st_blksize   = tmp.st_blksize ;
   *st_blocks    = tmp.st_blocks ;
}
/*
	To convert from epoch to human-readable date/time, read  
	https://www.epochconverter.com/programming/c
*/

/*
   int stat ( const char *file,  struct stat *buf) 
   Get file attributes for FILE and put them in BUF.  

   int fstat ( int fd, struct stat *buf )
   Get file attributes for the file, device, pipe, or socket
   that file descriptor FD is open on and put them in BUF. 

   int lstat ( const char *file, struct stat *buf) 
   Get file attributes about FILE and put them in BUF.
   If FILE is a symbolic link, do not follow it.  

*/

/*
   int fstatat (int fd, const char *file, struct stat *buf, int flag )

   Similar to stat, get the attributes for FILE and put them in BUF.
   Relative path names are interpreted relative to FD unless FD is
   AT_FDCWD. 

   If fstatat() is passed the special value AT_FDCWD in the fd parameter, 
   the current working directory shall be used and the behavior shall be 
   identical to a call to stat() or lstat() respectively, depending on  
   whether or not the AT_SYMLINK_NOFOLLOW bit is set in flag.
*/

