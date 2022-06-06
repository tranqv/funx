#include <sys/stat.h>


/*
   Decides whether a given file name is a directory.
   return: 
      1  if file exists and is a directory
*/
void  c_is_dir_ ( const char *path, int *ire ) 
{
   struct stat sb ;
   *ire = ( stat (path,&sb) == 0 ) && S_ISDIR (sb.st_mode) ;
}

/* 
   Check for regular file. 
*/
void  c_is_reg_ ( const char *path, int *ire ) 
{
   struct stat sb ;
   *ire = ( stat (path,&sb) == 0 ) && S_ISREG (sb.st_mode) ;
}

/*
   determine if filename is a block device 
*/
void  c_is_blkdev_ ( const char *path, int *ire )
{
   struct stat sb ;
   *ire = ( stat (path,&sb) == 0 ) && S_ISBLK (sb.st_mode) ;
}

/* 
   determine if filename is a character device 
*/
void  c_is_chrdev_ ( const char *path, int *ire )
{
   struct stat sb ;
   *ire = ( stat (path,&sb) == 0 ) && S_ISCHR (sb.st_mode) ;
}

/* 
   determine if filename is a fifo - named pipe 
*/
void  c_is_fifo_ ( const char *path, int *ire )
{
   struct stat sb ;
   *ire = ( stat (path,&sb) == 0 ) && S_ISFIFO (sb.st_mode) ;
}

/* 
   determine if filename is a socket 
*/
void  c_is_socket_ ( const char *path, int *ire )
{
   struct stat sb ;
   *ire = ( stat (path,&sb) == 0 ) && S_ISSOCK (sb.st_mode);
}

/* 
   Decides whether a given file name is a symbolic link.
   return 
      1  if file exists and is a symlink, 
      0  otherwise.
*/
void  c_is_link_ ( const char *path, int *ire ) 
{
   struct stat sb ;
/*
   Using stat may be wrong, since it use information of absolute path
   instead of symlink itseft. Use lstat instead.

   if ( lstat (path,&sb) ) 
   {
      *ire = 0;
   } 
   else 
   {
      *ire = S_ISLNK (sb.st_mode) ;
   }
*/
   *ire = ( lstat (path,&sb) == 0 ) && S_ISLNK (sb.st_mode);
}

/*
   Checks whether a given file exists.
   return 
      1  if file exists, 
      0  otherwise.
*/
void  c_is_exist_ ( const char *path, int *ire ) 
{
   struct stat sb;
   *ire = !stat (path,&sb);
/*
   Note: !0 is 1, while ~0 is -1. 
   When stat(...) is successful, it returns 0. 
*/
}






/*

#include <bits/stat.h>      
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



*/
