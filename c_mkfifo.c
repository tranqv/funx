////////////////////////////////////////////////////////////////////////////////

#include <sys/stat.h>
#include <errno.h>

#include "i_utils.h"

////////////////////////////////////////////////////////////////////////////////

void  c_mkfifo_decf_ ( const char *path, int *imode )
{
   if ( c_utils_lenIsOK__(path) ) 
   {
      mode_t old_mask = umask(0);
      mkfifo ( path, (mode_t) *imode );
      umask ( old_mask );
   }
   else
   {
      errno = ENAMETOOLONG ;
   }
}

void  c_mkfifo_octf_ ( const char *path, int *imode )
{
   int   idec = 0 ;
   c_utils_oct2dec_ ( imode, &idec ) ; 
   c_mkfifo_decf_ ( path, &idec ) ;
}

void  c_mkfifo_perm_ ( const char *path, char *perm ) 
{
   int   idec = 0 ; 
   c_utils_per2dec_ ( &perm[0], &idec ) ;
   c_mkfifo_decf_ ( path, &idec ) ;
}

//
// Default:
//
void  c_mkfifo_ ( const char *path, int *imode ) 
{
   c_mkfifo_decf_ ( path, imode ) ; 
}


////////////////////////////////////////////////////////////////////////////////


/*
NAME

    mkfifo, mkfifoat - make a FIFO special file

SYNOPSIS

    #include <sys/stat.h>

    int mkfifo(const char *path, mode_t mode);

    [OH] #include <fcntl.h>

    int mkfifoat(int fd, const char *path, mode_t mode);

DESCRIPTION

    The mkfifo() function shall create a new FIFO special file named by the pathname pointed to by path. The file permission bits of the new FIFO shall be initialized from mode. The file permission bits of the mode argument shall be modified by the process' file creation mask.

    When bits in mode other than the file permission bits are set, the effect is implementation-defined.

    If path names a symbolic link, mkfifo() shall fail and set errno to [EEXIST].

    The FIFO's user ID shall be set to the process' effective user ID. The FIFO's group ID shall be set to the group ID of the parent directory or to the effective group ID of the process. Implementations shall provide a way to initialize the FIFO's group ID to the group ID of the parent directory. Implementations may, but need not, provide an implementation-defined way to initialize the FIFO's group ID to the effective group ID of the calling process.

    Upon successful completion, mkfifo() shall mark for update the last data access, last data modification, and last file status change timestamps of the file. Also, the last data modification and last file status change timestamps of the directory that contains the new entry shall be marked for update.

    The mkfifoat() function shall be equivalent to the mkfifo() function except in the case where path specifies a relative path. In this case the newly created FIFO is created relative to the directory associated with the file descriptor fd instead of the current working directory. If the access mode of the open file description associated with the file descriptor is not O_SEARCH, the function shall check whether directory searches are permitted using the current permissions of the directory underlying the file descriptor. If the access mode is O_SEARCH, the function shall not perform the check.

    If mkfifoat() is passed the special value AT_FDCWD in the fd parameter, the current working directory shall be used and the behavior shall be identical to a call to mkfifo().

RETURN VALUE

    Upon successful completion, these functions shall return 0. Otherwise, these functions shall return -1 and set errno to indicate the error. If -1 is returned, no FIFO shall be created.

ERRORS

    These functions shall fail if:

    [EACCES]
        A component of the path prefix denies search permission, or write permission is denied on the parent directory of the FIFO to be created.
    [EEXIST]
        The named file already exists.
    [ELOOP]
        A loop exists in symbolic links encountered during resolution of the path argument.
    [ENAMETOOLONG]
        The length of a component of a pathname is longer than {NAME_MAX}.
    [ENOENT]
        A component of the path prefix of path does not name an existing file or path is an empty string.
    [ENOENT] or [ENOTDIR]
        The path argument contains at least one non- <slash> character and ends with one or more trailing <slash> characters. If path without the trailing <slash> characters would name an existing file, an [ENOENT] error shall not occur.
    [ENOSPC]
        The directory that would contain the new file cannot be extended or the file system is out of file-allocation resources.
    [ENOTDIR]
        A component of the path prefix names an existing file that is neither a directory nor a symbolic link to a directory.
    [EROFS]
        The named file resides on a read-only file system.

    The mkfifoat() function shall fail if:

    [EACCES]
        The access mode of the open file description associated with fd is not O_SEARCH and the permissions of the directory underlying fd do not permit directory searches.
    [EBADF]
        The path argument does not specify an absolute path and the fd argument is neither AT_FDCWD nor a valid file descriptor open for reading or searching.
    [ENOTDIR]
        The path argument is not an absolute path and fd is a file descriptor associated with a non-directory file.

    These functions may fail if:

    [ELOOP]
        More than {SYMLOOP_MAX} symbolic links were encountered during resolution of the path argument.
    [ENAMETOOLONG]
        The length of a pathname exceeds {PATH_MAX}, or pathname resolution of a symbolic link produced an intermediate result with a length that exceeds {PATH_MAX}.

The following sections are informative.
EXAMPLES

    Creating a FIFO File

    The following example shows how to create a FIFO file named /home/cnd/mod_done, with read/write permissions for owner, and with read permissions for group and others.

    #include <sys/types.h>
    #include <sys/stat.h>


    int status;
    ...
    status = mkfifo("/home/cnd/mod_done", S_IWUSR | S_IRUSR |
        S_IRGRP | S_IROTH);

APPLICATION USAGE

    None.

RATIONALE

    The syntax of this function is intended to maintain compatibility with historical implementations of mknod(). The latter function was included in the 1984 /usr/group standard but only for use in creating FIFO special files. The mknod() function was originally excluded from the POSIX.1-1988 standard as implementation-defined and replaced by mkdir() and mkfifo(). The mknod() function is now included for alignment with the Single UNIX Specification.

    The POSIX.1-1990 standard required that the group ID of a newly created FIFO be set to the group ID of its parent directory or to the effective group ID of the creating process. FIPS 151-2 required that implementations provide a way to have the group ID be set to the group ID of the containing directory, but did not prohibit implementations also supporting a way to set the group ID to the effective group ID of the creating process. Conforming applications should not assume which group ID will be used. If it matters, an application can use chown() to set the group ID after the FIFO is created, or determine under what conditions the implementation will set the desired group ID.

    The purpose of the mkfifoat() function is to create a FIFO special file in directories other than the current working directory without exposure to race conditions. Any part of the path of a file could be changed in parallel to a call to mkfifo(), resulting in unspecified behavior. By opening a file descriptor for the target directory and using the mkfifoat() function it can be guaranteed that the newly created FIFO is located relative to the desired directory.


*/








