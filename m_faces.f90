!-----------------------------------------------------------------------
!
!     1. To use buffer for reading path/filename properly and efficiently,
!        *  if SIZE_PATH is input, it's best to define
!              SIZE_PATH = CK_PATH_MAX 
!        *  if SIZE_FNAME is input, it's best to define
!              SIZE_FNAME = CK_NAME_MAX
!
!     2. All strings / character strings are with length of integer(8).
!
!-----------------------------------------------------------------------
!
      module mod_funx_faces 
!
      implicit none
      private  
!
!
      public :: funx_abspath
      interface funx_abspath
         module procedure :: funx_abspath
         module procedure :: funx_abspath_array
         module procedure :: funx_abspath_alloc 
         module procedure :: funx_abspath_dynch 
      end interface 
!
      public :: funx_access
      public :: funx_access_f, funx_access_r, funx_access_w, &
                funx_access_x
      public :: funx_chdir
      public :: funx_getarg
!
      public :: funx_getcwd
      interface funx_getcwd
         module procedure :: funx_getcwd
         module procedure :: funx_getcwd_array
         module procedure :: funx_getcwd_alloc 
         module procedure :: funx_getcwd_dynch 
      end interface 
!
      public :: funx_strftime, funx_clock
      public :: funx_chmod_decf, funx_chmod_octf, funx_chmod_perm, &
                funx_chmod
      public :: funx_stat, funx_stat_print 
      public :: funx_ctime
!
      public :: funx_closedir
      interface funx_closedir
         module procedure funx_closedir
         module procedure funx_closedir_intref
      end interface 
!
      public :: funx_fclose
      interface funx_fclose
         module procedure funx_fclose
         module procedure funx_fclose_intref
      end interface 
!
      public :: funx_feof
      interface funx_feof
         module procedure funx_feof
         module procedure funx_feof_intref
      end interface 
!
      public :: funx_ferror
      interface funx_ferror
         module procedure funx_ferror
         module procedure funx_ferror_intref
      end interface 
!
      public :: funx_fflush
      interface funx_fflush
         module procedure funx_fflush
         module procedure funx_fflush_intref
      end interface
! 
      public :: funx_fflush_all, funx_fflush_stdout, &
                funx_fflush_stderr, funx_fflush_stdin
!
      public :: funx_fgetc
      interface funx_fgetc
         module procedure funx_fgetc
         module procedure funx_fgetc_intref
      end interface 
!
      public :: funx_fgetc_stdin 
!
      public :: funx_getc
      interface funx_getc
         module procedure funx_getc
         module procedure funx_getc_intref
      end interface 
!
      public :: funx_getc_stdin 
!
      public :: funx_fgetlen
      interface funx_fgetlen
         module procedure funx_fgetlen
         module procedure funx_fgetlen_intref
      end interface
!
      public :: funx_fgetpos
      interface funx_fgetpos
         module procedure funx_fgetpos
         module procedure funx_fgetpos_intref
      end interface
!
      public :: funx_fgets
      interface funx_fgets
         module procedure funx_fgets
         module procedure funx_fgets_array
         module procedure funx_fgets_intref
         module procedure funx_fgets_intref_array
      end interface 
!
      public :: funx_fgets_stdin 
      interface funx_fgets_stdin 
         module procedure funx_fgets_stdin
         module procedure funx_fgets_stdin_array 
      end interface 
!
      public :: funx_fileno
      interface funx_fileno
         module procedure funx_fileno
         module procedure funx_fileno_intref
      end interface
!
      public :: funx_finuse
      interface funx_finuse
         module procedure funx_finuse
         module procedure funx_finuse_intref
      end interface
!
      public :: funx_fopen
      interface funx_fopen
         module procedure funx_fopen
         module procedure funx_fopen_intref
      end interface
!
      public :: funx_fputc
      interface funx_fputc
         module procedure funx_fputc
         module procedure funx_fputc_intref
      end interface
!
      public :: funx_fputc_stdout, funx_fputc_stderr 
!
      public :: funx_putc
      interface funx_putc
         module procedure funx_putc
         module procedure funx_putc_intref
      end interface
!
      public :: funx_putc_stdout, funx_putc_stderr 
!
      public :: funx_fputs
      interface funx_fputs
         module procedure funx_fputs_0
         module procedure funx_fputs
         module procedure funx_fputs_array
         module procedure funx_fputs_intref_0
         module procedure funx_fputs_intref
         module procedure funx_fputs_intref_array
      end interface 
!
      public :: funx_fputs_stdout
      interface funx_fputs_stdout
         module procedure funx_fputs_stdout_0
         module procedure funx_fputs_stdout
         module procedure funx_fputs_stdout_array
      end interface 
!
      public :: funx_fputs_stderr
      interface funx_fputs_stderr
         module procedure funx_fputs_stderr_0
         module procedure funx_fputs_stderr
         module procedure funx_fputs_stderr_array
      end interface 
!
      public :: funx_fread_afloat
      interface funx_fread_afloat
         module procedure funx_fread_afloat
         module procedure funx_fread_afloat_intref
      end interface
!
      public :: funx_fread_astr
      interface funx_fread_astr
         module procedure :: funx_fread_astr
         module procedure :: funx_fread_astr_array 
         module procedure :: funx_fread_astr_intref
         module procedure :: funx_fread_astr_intref_array 
      end interface 
!
      public :: funx_frewind
      interface funx_frewind
         module procedure funx_frewind
         module procedure funx_frewind_intref
      end interface 
!
      public :: funx_fseek
      interface funx_fseek
         module procedure funx_fseek
         module procedure funx_fseek_intref
      end interface 
!
      public :: funx_fseeko
      interface funx_fseeko
         module procedure funx_fseeko
         module procedure funx_fseeko_intref
      end interface 
!
      public :: funx_fsetpos
      interface funx_fsetpos
         module procedure funx_fsetpos
         module procedure funx_fsetpos_intref
      end interface 
!
      public :: funx_fstderr
      interface funx_fstderr
         module procedure funx_fstderr
         module procedure funx_fstderr_intref
      end interface 
!
      public :: funx_fstdin
      interface funx_fstdin
         module procedure funx_fstdin
         module procedure funx_fstdin_intref
      end interface
!
      public :: funx_fstdout
      interface funx_fstdout
         module procedure funx_fstdout
         module procedure funx_fstdout_intref
      end interface
!
      public :: funx_ftell
      interface funx_ftell
         module procedure funx_ftell
         module procedure funx_ftell_intref
      end interface
!
      public :: funx_ftello
      interface funx_ftello
         module procedure funx_ftello
         module procedure funx_ftello_intref
      end interface
!
      public :: funx_fwrite_afloat
      interface funx_fwrite_afloat
         module procedure funx_fwrite_afloat
         module procedure funx_fwrite_afloat_intref
      end interface
!
      public :: funx_fwrite_astr
      interface funx_fwrite_astr
         module procedure :: funx_fwrite_astr
         module procedure :: funx_fwrite_astr_array 
         module procedure :: funx_fwrite_astr_intref
         module procedure :: funx_fwrite_astr_intref_array 
      end interface 
!
      public :: funx_getchar
!
      public :: funx_getenv
      interface funx_getenv
         module procedure :: funx_getenv
         module procedure :: funx_getenv_array
         module procedure :: funx_getenv_alloc 
         module procedure :: funx_getenv_dynch 
      end interface 
!
      public :: funx_link
      public :: funx_mkdir_decf, funx_mkdir_octf, funx_mkdir_perm, &
                funx_mkdir
      public :: funx_mkpath_decf, funx_mkpath_octf, funx_mkpath_perm, &
                funx_mkpath
!
      public :: funx_opendir
      interface funx_opendir
         module procedure funx_opendir
         module procedure funx_opendir_intref
      end interface
!
      public :: funx_pclose
      interface funx_pclose
         module procedure funx_pclose
         module procedure funx_pclose_intref
      end interface
!
      public :: funx_popen
      interface funx_popen
         module procedure funx_popen
         module procedure funx_popen_intref
      end interface
!
      public :: funx_is_dir, funx_is_reg, funx_is_blkdev,      &
                funx_is_chrdev, funx_is_fifo, funx_is_socket,  &
                funx_is_link, funx_is_exist, funx_is_r_ok,     & 
                funx_is_w_ok, funx_is_x_ok
      public :: funx_putchar
!
      public :: funx_readdir
      interface funx_readdir
         module procedure :: funx_readdir
         module procedure :: funx_readdir_array
         module procedure :: funx_readdir_intref
         module procedure :: funx_readdir_intref_array
      end interface 
!
      public :: funx_readlink
      interface funx_readlink
         module procedure :: funx_readlink
         module procedure :: funx_readlink_array
         module procedure :: funx_readlink_alloc 
         module procedure :: funx_readlink_dynch 
      end interface 
!
      public :: funx_relpath
      interface funx_relpath
         module procedure :: funx_relpath
         module procedure :: funx_relpath_array
         module procedure :: funx_relpath_alloc 
         module procedure :: funx_relpath_dynch 
      end interface 
!
      public :: funx_rewinddir
      interface funx_rewinddir
         module procedure funx_rewinddir
         module procedure funx_rewinddir_intref
      end interface
!
      public :: funx_rmdir, funx_rmpath
      public :: funx_seterrno, funx_reseterr, funx_geterrno, funx_perror
      public :: funx_symlink
      public :: funx_time, funx_times
      public :: funx_unlink
!
      public :: funx_strerror
      interface funx_strerror
         module procedure funx_strerror
         module procedure funx_strerror_array
      end interface
!
!     Utils:
!
      public ::                                      &
         funx_dec2oct, funx_oct2dec, funx_oct2per,   &
         funx_per2oct, funx_dec2per, funx_per2dec,   &
         funx_oct2fup, funx_fup2oct, funx_dec2fup,   &
         funx_fup2dec, funx_scalebyte

      public :: funx_vgetaddr
      interface funx_vgetaddr
         module procedure :: funx_vgetaddr_int
         module procedure :: funx_vgetaddr_long
         module procedure :: funx_vgetaddr_float
         module procedure :: funx_vgetaddr_double
         module procedure :: funx_vgetaddr_char
         module procedure :: funx_vgetaddr_str
      end interface 

      public :: funx_vgetinfo
      interface funx_vgetinfo
         module procedure :: funx_vgetinfo_int
         module procedure :: funx_vgetinfo_long
         module procedure :: funx_vgetinfo_float
         module procedure :: funx_vgetinfo_double
         module procedure :: funx_vgetinfo_char
      end interface 

      public :: funx_strlencrop
      interface funx_strlencrop
         module procedure :: funx_strlencrop
         module procedure :: funx_strlencrop_array
      end interface 

      public :: funx_strlentrim
      interface funx_strlentrim
         module procedure :: funx_strlentrim
         module procedure :: funx_strlentrim_array
      end interface 








!
!-----------------------------------------------------------------------
      contains 
!-----------------------------------------------------------------------
!
      subroutine  funx_seterrno ( errc )
!
      use mod_funx_param, only: ck_int 
      implicit none 
      integer(kind=ck_int),intent(in) :: errc
!
      external :: f_seterrno
!
      call f_seterrno ( errc )
!
      end subroutine funx_seterrno
!
!-----
!
      subroutine  funx_reseterr ( errc )
!
      use mod_funx_param, only: ck_int 
      implicit none 
      integer(kind=ck_int),intent(inout) :: errc
!
      errc = 0
      call funx_seterrno ( errc )
!
      end subroutine funx_reseterr
!
!-----------------------------------------------------------------------
!
      subroutine  funx_geterrno ( ier )
!
      use mod_funx_param, only: ck_int  
      implicit none 
      integer(kind=ck_int),intent(out) :: ier
      external :: f_geterrno
!
      call f_geterrno ( ier )
!
      return 
      end subroutine funx_geterrno
!
!-----------------------------------------------------------------------
!
      subroutine  funx_perror ( str, errno )
!
      use mod_funx_param, only: ck_int
      implicit none 
      character(len=*),intent(in)      :: str
      integer(kind=ck_int),intent(in)  :: errno
      external :: f_perror
!
      call f_perror ( str, errno )
!
      end subroutine funx_perror
!
!-----------------------------------------------------------------------
!
      subroutine  funx_abspath ( &
                  fname, path, size_path, lentrim_path, errno ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)          :: fname
      integer(kind=ck_size_t),intent(in)   :: size_path
      character(len=size_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)  :: lentrim_path 
      integer(kind=ck_int),intent(out)     :: errno
!
      external :: f_abspath 
!
!
      call funx_reseterr ( errno )
      call f_abspath ( fname, path, size_path, lentrim_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_abspath 
!
!-----
!
      subroutine  funx_abspath_array ( &
                  fname, path, size_path, lentrim_path, errno ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)                :: fname
      integer(kind=ck_size_t),intent(in)         :: size_path
      character,dimension(size_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)        :: lentrim_path 
      integer(kind=ck_int),intent(out)           :: errno
!
      external :: f_abspath
!     external :: f_abspath_array  
!
!
      call funx_reseterr ( errno )
      call f_abspath ( fname, path(1), size_path, lentrim_path ) ! equiv
!     call f_abspath_array ( fname, path(1), size_path, lentrim_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_abspath_array
!
!------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  funx_abspath_alloc ( fname, apath, len_apath, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)                     :: fname
      character,dimension(:),allocatable,intent(out)  :: apath
      integer(kind=ck_size_t),intent(out)             :: len_apath 
      integer(kind=ck_int),intent(out)                :: errno
!
      interface 
         subroutine  f_abspath_alloc ( wfname, wapath, wlen_apath )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)                     :: wfname
         character,dimension(:),allocatable,intent(out)  :: wapath
         integer(kind=ck_size_t),intent(out)             :: wlen_apath 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_abspath_alloc ( fname, apath, len_apath )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_abspath_alloc
!
!------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  funx_abspath_dynch ( fname, apath, len_apath, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)              :: fname
      character(len=:),allocatable,intent(out) :: apath
      integer(kind=ck_size_t),intent(out)      :: len_apath 
      integer(kind=ck_int),intent(out)         :: errno
!
      interface 
         subroutine  f_abspath_dynch ( wfname, wapath, wlen_apath )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)              :: wfname
         character(len=:),allocatable,intent(out) :: wapath
         integer(kind=ck_size_t),intent(out)      :: wlen_apath 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_abspath_dynch ( fname, apath, len_apath )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_abspath_dynch
!
!-----------------------------------------------------------------------
!
      subroutine  funx_access ( path, mode, res, errno )
!  
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(in)  :: mode 
      integer(kind=ck_int),intent(out) :: res  
      integer(kind=ck_int),intent(out) :: errno   
!
      external :: f_access 
!
!
      call funx_reseterr ( errno )
      call f_access ( path, mode, res )
      call funx_geterrno ( errno )
!
      end subroutine  funx_access 
!
!-----------------------------------------------------------------------
!
!     Check for existence:
!
      subroutine  funx_access_f ( path, errno )
! 
      use mod_funx_param, only: ck_int, ck_f_ok
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno   
!
      external :: f_access 
      integer(kind=ck_int) :: idummy  
!
!
      call funx_reseterr ( errno )
      call f_access ( path, ck_f_ok, idummy )
      call funx_geterrno ( errno )
!
      end subroutine  funx_access_f 
!
!-----------------------------------------------------------------------
!
!     Check for read:
!
      subroutine  funx_access_r ( path, errno )
!  
      use mod_funx_param, only: ck_int, ck_r_ok
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno   
!
      external :: f_access 
      integer(kind=ck_int) :: idummy  
!
!
      call funx_reseterr ( errno )
      call f_access ( path, ck_r_ok, idummy )
      call funx_geterrno ( errno )
!
      end subroutine  funx_access_r 
!
!-----------------------------------------------------------------------
!
!     Check for write:
!
      subroutine  funx_access_w ( path, errno )
!
      use mod_funx_param, only: ck_int, ck_w_ok 
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno   
!
      external :: f_access 
      integer(kind=ck_int) :: idummy  
!
!
      call funx_reseterr ( errno )
      call f_access ( path, ck_w_ok, idummy )
      call funx_geterrno ( errno )
!
      end subroutine  funx_access_w 
!
!-----------------------------------------------------------------------
!
!     Check for execute:
!
      subroutine  funx_access_x ( path, errno )
!  
      use mod_funx_param, only: ck_int, ck_x_ok 
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno   
!
      external :: f_access 
      integer(kind=ck_int) :: idummy  
!
!
      call funx_reseterr ( errno )
      call f_access ( path, ck_x_ok, idummy )
      call funx_geterrno ( errno )
!
      end subroutine  funx_access_x 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_chdir ( path, errno )
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_chdir 
!
!
      call funx_reseterr ( errno )
      call f_chdir ( path )
      call funx_geterrno( errno )
!
      end subroutine funx_chdir
!
!-----------------------------------------------------------------------
!
      subroutine  funx_getarg ( k, arg, lentrim_arg, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int, ck_einval 
      implicit none 
!
      integer,intent(in)                  :: k
      character(len=*),intent(out)        :: arg
      integer(kind=ck_size_t),intent(out) :: lentrim_arg
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_getarg
!
!
      call funx_reseterr ( errno )
      call f_getarg ( k, arg, lentrim_arg )
      if ( lentrim_arg .eq. -1 ) errno = ck_einval
!
      end subroutine funx_getarg
!
!-----------------------------------------------------------------------
!
!     out of this scope:  lenpath = len(path)
!     After calling, lentrim is same as len_trim(path)
!
      subroutine  funx_getcwd ( path, lenpath, lentrim, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int, ck_erange, &
                                ck_einval, ck_eacces, ck_enomem
      implicit none 
!
!
      integer(kind=ck_size_t),intent(in)     :: lenpath
      character(len=lenpath),intent(inout)   :: path
      integer(kind=ck_size_t),intent(out)    :: lentrim 
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_getcwd
!
!
      call funx_reseterr ( errno )
      call f_getcwd ( path, lenpath, lentrim )
      call funx_geterrno ( errno )
!
      if ( errno .ne. 0 ) then 
         select case ( errno )
         case (ck_erange)
            write(*,100) errno
         case (ck_einval)
            write(*,101) errno
         case (ck_eacces)
            write(*,102) errno
         case (ck_enomem)
            write(*,103) errno
         end select 
      endif 

      if ( lentrim .gt. 0 ) path ( lentrim+1 : lenpath ) = ''

      return
! 
100   format ( &
         'ERROR: char *getcwd ( char *buf, size_t size )', /, &
         '-->', 4x, 'ier = ', i4, /, 7x, &
         'The size argument is greater than 0, but is smaller &
         &than the length of the string +1. Increase it!' )
101   format ( &
         'ERROR: char *getcwd ( char *buf, size_t size )', /, &
         '-->', 4x, 'ier = ', i4, /, 7x, &
         'The size argument is 0.' )
102   format ( &
         'ERROR: char *getcwd ( char *buf, size_t size )', /, &
         '-->', 4x, 'ier = ', i4, /, 7x, &
         'Search permission was denied for the current directory, &
         &or read or search permission was denied for a directory &
         &above the current directory in the file hierarchy.' )
103   format ( &
         'ERROR: char *getcwd ( char *buf, size_t size )', /, &
         '-->', 4x, 'ier = ', i4, /, 7x, &
         'Insufficient storage space is available.' )
!
      end subroutine funx_getcwd
!
!-----
!
      subroutine  funx_getcwd_array ( &
                  path, len_path, lentrim_path, errno ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_size_t),intent(in)        :: len_path
      character,dimension(len_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)       :: lentrim_path 
      integer(kind=ck_int),intent(out)          :: errno
!
      external :: f_getcwd
!     external :: f_getcwd_array  
!
!
      call funx_reseterr ( errno )
      call f_getcwd ( path(1), len_path, lentrim_path )  ! equiv 
!     call f_getcwd_array ( path, len_path, lentrim_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_getcwd_array
!
!------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  funx_getcwd_alloc ( path, len_path, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character,dimension(:),allocatable,intent(out)  :: path
      integer(kind=ck_size_t),intent(out)             :: len_path 
      integer(kind=ck_int),intent(out)                :: errno
!
      interface 
         subroutine  f_getcwd_alloc ( wpath, wlen_path )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character,dimension(:),allocatable,intent(out)  :: wpath
         integer(kind=ck_size_t),intent(out)             :: wlen_path 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_getcwd_alloc ( path, len_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_getcwd_alloc
!
!------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  funx_getcwd_dynch ( path, len_path, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=:),allocatable,intent(out) :: path
      integer(kind=ck_size_t),intent(out)      :: len_path 
      integer(kind=ck_int),intent(out)         :: errno
!
      interface 
         subroutine  f_getcwd_dynch ( wpath, wlen_path )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=:),allocatable,intent(out) :: wpath
         integer(kind=ck_size_t),intent(out)      :: wlen_path 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_getcwd_dynch ( path, len_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_getcwd_dynch
!
!-----------------------------------------------------------------------
!
      subroutine  funx_chmod_decf ( path, mdec, errno )
!  
      use mod_funx_param, only: ck_int, ck_mode_t 
      implicit none 
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: mdec
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_chmod_decf 
!
!
      call funx_reseterr ( errno )
      call f_chmod_decf ( path, mdec )
      call funx_geterrno ( errno )
!
      end subroutine funx_chmod_decf 
!
!-----
!
      subroutine  funx_chmod_octf ( path, moct, errno )
!  
      use mod_funx_param, only: ck_int, ck_mode_t 
      implicit none 
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: moct
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_chmod_octf
!
!
      call funx_reseterr ( errno )
      call f_chmod_octf ( path, moct )
      call funx_geterrno ( errno )
!
      end subroutine funx_chmod_octf 
!
!-----
!
!     Next, let us define subroutine working with mask in the character
!     form:
!           
!           123456789
!           ---------
!     fmt= 'rwxrwxrwx'
!           ---___---         
!            U  G  O       U:user, G:group, O:others
!
!     For example, with the input mask
!
!     fmt = 'rwxr--r--'
!
!     the output directory has persission: 
!     +  User (onwer) can read, write, execute
!     +  Group can read only.
!     +  Others can only read.
!
!
      subroutine  funx_chmod_perm ( path, perm, errno )
!  
      use mod_funx_param, only: ck_int, ck_mode_t 
      implicit none 
!
      character(len=*),intent(in)      :: path
      character(len=*),intent(in)      :: perm 
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_chmod_perm
!
!
      call funx_reseterr ( errno )
      call f_chmod_perm ( path, perm )
      call funx_geterrno ( errno )
!
      end subroutine funx_chmod_perm 
!
!-----
!
      subroutine  funx_chmod ( path, mdec, errno )
!  
      use mod_funx_param, only: ck_int, ck_mode_t 
      implicit none 
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: mdec
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_chmod
!
!
      call funx_reseterr ( errno )
      call f_chmod ( path, mdec )
      call funx_geterrno ( errno )
!
      end subroutine funx_chmod
!
!-----------------------------------------------------------------------
!     Ex:
!        str = "Wed 2020-03-11 05:57:41 UTC", len_str = lentrim_str = 27 
!
!     We can determine len_str (~ 30) in advance.
!
      subroutine  funx_strftime ( &
                  rawtime, str, len_str, lentrim_str, errno ) 
!
      use mod_funx_param, only: ck_time_t, ck_size_t, ck_int 
      implicit none 
!
      integer(kind=ck_time_t),intent(in)     :: rawtime  
      integer(kind=ck_size_t),intent(in)     :: len_str
      character(len=len_str),intent(inout)   :: str
      integer(kind=ck_size_t),intent(out)    :: lentrim_str
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_strftime 
!
!
      call funx_reseterr ( errno ) 
      call f_strftime ( rawtime, str, len_str, lentrim_str )
      call funx_geterrno ( errno )
!      
      end subroutine funx_strftime
!
!-----------------------------------------------------------------------
!
      subroutine  funx_stat ( path, fstat, errno )
!
      use mod_funx_param, only: ck_stat, ck_int 
      implicit none 
!
      character(len=*),intent(in)      :: path
      type(ck_stat),intent(out)        :: fstat
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_stat 
!
!
      call funx_reseterr ( errno )
      call f_stat ( path, fstat ) 
      call funx_geterrno ( errno )
!
      end subroutine funx_stat
!
!-----
!
      subroutine  funx_stat_print ( fstat ) 
!
      use mod_funx_param, only: ck_stat
      implicit none 
!
      type(ck_stat),intent(in) :: fstat
!
      external :: f_stat_print
!
!
      call f_stat_print ( fstat ) 
!
      end subroutine funx_stat_print 
!
!-----------------------------------------------------------------------
!
!     Ex: 
!        Str = "Wed Feb 19 04:06:58 2020", len_str >= lentrim_str = 24
!
!     We can determine len_str (~ 30) in advance.
!
      subroutine  funx_ctime ( tim, str, len_str, lentrim_str, errno )
!
      use mod_funx_param, only: ck_time_t, ck_size_t, ck_int  
      implicit none 
!
      integer(kind=ck_time_t),intent(in)     :: tim
      integer(kind=ck_size_t),intent(in)     :: len_str
      character(len=len_str),intent(inout)   :: str 
      integer(kind=ck_size_t),intent(out)    :: lentrim_str
      integer(kind=ck_int),intent(out)       :: errno 
!
      external :: f_ctime
!
!
      call funx_reseterr ( errno )
      call f_ctime ( tim, str, len_str, lentrim_str )
      call funx_geterrno ( errno )
!
      end subroutine funx_ctime
!
!-----------------------------------------------------------------------
!
      subroutine  funx_clock ( dtime_in_sec, errno )
!
      use mod_funx_param, only: ck_int, ck_double 
      implicit none 
!
      real(kind=ck_double),intent(inout)  :: dtime_in_sec
      integer(kind=ck_int),intent(out)    :: errno 
!
      external :: f_clock
!
!
      call funx_reseterr ( errno )
      call f_clock ( dtime_in_sec )
      call funx_geterrno ( errno )
!
      end subroutine funx_clock 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_closedir ( dir, errno )
!
      use mod_funx_param, only: ck_int, ck_dir
      implicit none 
!
      type(ck_dir),intent(inout)       :: dir
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_closedir 
!
!
      call funx_reseterr ( errno )
      call f_closedir ( dir )
      call funx_geterrno ( errno )
!
      end subroutine funx_closedir
!
!-----
!
      subroutine  funx_closedir_intref ( iptr, errno )
!
      use mod_funx_param, only: ck_intptr_t, ck_int 
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr
      integer(kind=ck_int),intent(out)     :: errno
!
      external :: f_closedir_intref
!
!
      call funx_reseterr ( errno )
      call f_closedir_intref ( iptr )
      call funx_geterrno ( errno )
!
      end subroutine funx_closedir_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fclose ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(out) :: istat 
!
      external :: f_fclose 
!
!
      call f_fclose ( file, istat )
!
      return 
      end subroutine funx_fclose
!
!-----
!
      subroutine  funx_fclose_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: istat 
!
      external :: f_fclose_intref 
!
!
      call f_fclose_intref ( iptr, istat )
!
      end subroutine funx_fclose_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_feof ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(inout)      :: file 
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_feof 
!
!
      call f_feof ( file, istat ) 
!
      end subroutine funx_feof
!
!-----
!
      subroutine  funx_feof_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: istat
!
      external :: f_feof_intref
!
!
      call f_feof_intref ( iptr, istat ) 
!
      end subroutine funx_feof_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_ferror ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(inout)      :: file 
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_ferror 
!
!
      call f_ferror ( file, istat ) 
!
      end subroutine funx_ferror
!
!-----
!
      subroutine  funx_ferror_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr
      integer(kind=ck_int),intent(out)     :: istat
!
      external :: f_ferror_intref 
!
!
      call f_ferror_intref ( iptr, istat ) 
!
      end subroutine funx_ferror_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fflush_all ( istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_fflush_all 
!
!
      call f_fflush_all ( istat ) 
!
      end subroutine funx_fflush_all
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fflush ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(inout)      :: file 
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_fflush 
!
!
      call f_fflush ( file, istat ) 
!
      end subroutine funx_fflush
!
!-----
!
      subroutine  funx_fflush_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr     
      integer(kind=ck_int),intent(out)     :: istat
!
      external :: f_fflush_intref
!
!
      call f_fflush_intref ( iptr, istat ) 
!
      end subroutine funx_fflush_intref
!
!-----
!
      subroutine  funx_fflush_stderr ( istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_fflush_stderr 
!
!
      call f_fflush_stderr ( istat ) 
!
      end subroutine funx_fflush_stderr
!
!-----
!
      subroutine  funx_fflush_stdout ( istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_fflush_stdout 
!
!
      call f_fflush_stdout ( istat ) 
!
      end subroutine funx_fflush_stdout
!
!-----
!
      subroutine  funx_fflush_stdin ( istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_fflush_stdin 
!
!
      call f_fflush_stdin ( istat ) 
!
      end subroutine funx_fflush_stdin
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fgetc ( file, c ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(out) :: c 
!
      external :: f_fgetc
!
!
      call f_fgetc ( file, c )
!
      end subroutine funx_fgetc
!
!-----
!
      subroutine  funx_fgetc_intref ( iptr, c ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr     
      integer(kind=ck_int),intent(out)     :: c 
!
      external :: f_fgetc_intref
!
!
      call f_fgetc_intref ( iptr, c )
!
      end subroutine funx_fgetc_intref
!
!-----
!
      subroutine  funx_fgetc_stdin ( c ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(out) :: c 
!
      external :: f_fgetc_stdin
!
!
      call f_fgetc_stdin ( c )
!
      return 
      end subroutine funx_fgetc_stdin 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_getc ( file, c ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(out) :: c 
!
      external :: f_getc
!
!
      call f_getc ( file, c )
!
      end subroutine funx_getc
!
!-----
!
      subroutine  funx_getc_intref ( iptr, c ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr     
      integer(kind=ck_int),intent(out)     :: c 
!
      external :: f_getc_intref
!
!
      call f_getc_intref ( iptr, c )
!
      end subroutine funx_getc_intref
!
!-----
!
      subroutine  funx_getc_stdin ( c ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(out) :: c 
!
      external :: f_getc_stdin
!
!
      call f_getc_stdin ( c )
!
      return 
      end subroutine funx_getc_stdin 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fgetlen ( file, len ) 
!
      use mod_funx_param, only: ck_file, ck_long
      implicit none 
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_long),intent(out)   :: len
!
      external :: f_fgetlen 
!
!
      call f_fgetlen ( file, len )
!
      end subroutine funx_fgetlen
!
!-----
!
      subroutine  funx_fgetlen_intref ( iptr, len ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_long
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_long),intent(out)    :: len
!
      external :: f_fgetlen_intref 
!
!
      call f_fgetlen_intref ( iptr, len )
!
      end subroutine funx_fgetlen_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fgetpos ( file, pos ) 
!
      use mod_funx_param, only: ck_file, ck_fpos_t
      implicit none 
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_fpos_t),intent(out) :: pos
!
      external :: f_fgetpos 
!
!
      call f_fgetpos ( file, pos )
!
      end subroutine funx_fgetpos
!
!-----
!
      subroutine  funx_fgetpos_intref ( iptr, pos ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_fpos_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_fpos_t),intent(out)  :: pos
!
      external :: f_fgetpos_intref 
!
!
      call f_fgetpos_intref ( iptr, pos )
!
      end subroutine funx_fgetpos_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fgets ( file, s, lm, lt ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_size_t),intent(in)  :: lm
      character(len=lm),intent(out)       :: s 
      integer(kind=ck_size_t),intent(out) :: lt
!
      integer(kind=ck_int)    lm4, lt4 
      external ::             f_fgets
!
!
      lm4 = int ( lm,  kind=ck_int )  
      call f_fgets ( file, s, lm4, lt4 )
      lt  = int ( lt4, kind=ck_size_t ) 
!
      end subroutine funx_fgets
!
!-----
!
      subroutine  funx_fgets_array ( file, s, lm, lt ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_size_t),intent(in)  :: lm
      character,dimension(lm),intent(out) :: s 
      integer(kind=ck_size_t),intent(out) :: lt
!
      integer(kind=ck_int)    lm4, lt4 
      external ::             f_fgets
!
!
      lm4 = int ( lm,  kind=ck_int ) 
      call f_fgets ( file, s(1), lm4, lt4 ) 
      lt  = int ( lt4, kind=ck_size_t ) 
!
      end subroutine funx_fgets_array
!
!-----
!
      subroutine  funx_fgets_intref ( iptr, s, lm, lt ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_size_t),intent(in)   :: lm
      character(len=lm),intent(out)        :: s 
      integer(kind=ck_size_t),intent(out)  :: lt
!
      integer(kind=ck_int)    lm4, lt4 
      external ::             f_fgets_intref
!
!
      lm4 = int ( lm,  kind=ck_int ) 
      call f_fgets_intref ( iptr, s, lm4, lt4 )
      lt  = int ( lt4, kind=ck_size_t ) 
!
      end subroutine funx_fgets_intref
!
!-----
!
      subroutine  funx_fgets_intref_array ( iptr, s, lm, lt ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_size_t),intent(in)     :: lm
      character,dimension(lm),intent(out)    :: s 
      integer(kind=ck_size_t),intent(out)    :: lt
!
      integer(kind=ck_int)    lm4, lt4 
      external ::             f_fgets_intref
!
!
      lm4 = int ( lm,  kind=ck_int ) 
      call f_fgets_intref ( iptr, s(1), lm4, lt4 )
      lt  = int ( lt4, kind=ck_size_t ) 
!
      end subroutine funx_fgets_intref_array
!
!-----
!
      subroutine  funx_fgets_stdin ( s, lm, lt ) 
!
      use mod_funx_param, only: ck_int, ck_size_t
      implicit none 
!
      integer(kind=ck_size_t),intent(in)  :: lm
      character(len=lm),intent(out)       :: s 
      integer(kind=ck_size_t),intent(out) :: lt
!
      integer(kind=ck_int)    lm4, lt4
      external ::             f_fgets_stdin
!
!
      lm4 = int ( lm,  kind=ck_int ) 
      call f_fgets_stdin ( s, lm4, lt4  )
      lt  = int ( lt4, kind=ck_size_t ) 
!
      end subroutine funx_fgets_stdin
!
!-----
!
      subroutine  funx_fgets_stdin_array ( s, lm, lt ) 
!
      use mod_funx_param, only: ck_int, ck_size_t
      implicit none 
!
      integer(kind=ck_size_t),intent(in)  :: lm
      character,dimension(lm),intent(out) :: s 
      integer(kind=ck_size_t),intent(out) :: lt
!
      integer(kind=ck_int)    lm4, lt4
      external ::             f_fgets_stdin
!
!
      lm4 = int ( lm,  kind=ck_int )
      call f_fgets_stdin ( s(1), lm4, lt4 ) 
      lt  = int ( lt4, kind=ck_size_t ) 
!
      end subroutine funx_fgets_stdin_array
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fileno ( file, fno, errno ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(out) :: fno 
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_fileno
!
!
      call funx_reseterr ( errno )
      call f_fileno ( file, fno )
      call funx_geterrno ( errno )
!
      end subroutine funx_fileno
!
!-----
!
      subroutine  funx_fileno_intref ( iptr, fno ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: fno 
!
      external :: f_fileno_intref
!
!
      call f_fileno_intref ( iptr, fno )
!
      end subroutine funx_fileno_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_finuse ( file, lstat )
!
      use mod_funx_param, only: ck_file
      implicit none 
!
      type(ck_file),intent(in)   :: file 
      logical,intent(out)        :: lstat
!
      external :: f_finuse 
!
!
      call f_finuse ( file, lstat )
!
      end subroutine funx_finuse
!
!-----
!
      subroutine  funx_finuse_intref ( iptr, lstat )
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      logical,intent(out)                    :: lstat
!
      external :: f_finuse_intref
!
!
      call f_finuse_intref ( iptr, lstat )
!
      end subroutine funx_finuse_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fopen ( file, path, mode, errno ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(out)        :: file 
      character(len=*),intent(in)      :: path, mode
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_fopen 
!
!
      call funx_reseterr ( errno )
      call f_fopen ( file, path, mode )
      call funx_geterrno ( errno )
!
      end subroutine funx_fopen
!
!-----
!
      subroutine  funx_fopen_intref ( iptr, path, mode, errno ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(out)  :: iptr
      character(len=*),intent(in)            :: path, mode
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_fopen_intref
!
!
      call funx_reseterr ( errno )
      call f_fopen_intref ( iptr, path, mode )
      call funx_geterrno ( errno )
!
      end subroutine funx_fopen_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fputc ( file, c, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_fputc
!
!
      call f_fputc ( file, c, istat )
!
      end subroutine funx_fputc
!
!-----
!
      subroutine  funx_fputc_intref ( iptr, c, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      character(len=1),intent(in)            :: c 
      integer(kind=ck_int),intent(out)       :: istat  
!
      external :: f_fputc_intref
!
!
      call f_fputc_intref ( iptr, c, istat )
!
      end subroutine funx_fputc_intref
!
!-----
!
      subroutine  funx_fputc_stderr ( c, istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_fputc_stderr
!
!
      call f_fputc_stderr ( c, istat )
!
      return 
      end subroutine funx_fputc_stderr 
!
!-----
!
      subroutine  funx_fputc_stdout ( c, istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_fputc_stdout
!
!
      call f_fputc_stdout ( c, istat )
!
      end subroutine funx_fputc_stdout 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_putc ( file, c, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_putc
!
!
      call f_putc ( file, c, istat )
!
      end subroutine funx_putc
!
!-----
!
      subroutine  funx_putc_intref ( iptr, c, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      character(len=1),intent(in)            :: c 
      integer(kind=ck_int),intent(out)       :: istat  
!
      external :: f_putc_intref
!
!
      call f_putc_intref ( iptr, c, istat )
!
      end subroutine funx_putc_intref
!
!-----
!
      subroutine  funx_putc_stderr ( c, istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_putc_stderr
!
!
      call f_putc_stderr ( c, istat )
!
      return 
      end subroutine funx_putc_stderr 
!
!-----
!
      subroutine  funx_putc_stdout ( c, istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=1),intent(in)      :: c 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_putc_stdout
!
!
      call f_putc_stdout ( c, istat )
!
      end subroutine funx_putc_stdout 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fputs_0 ( file, s, istat ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      character(len=*),intent(in)      :: s 
      integer(kind=ck_int),intent(out) :: istat  
!
      external ::                f_fputs
      integer(kind=ck_size_t)    ls
!
!
      ls = len_trim(s)
      call f_fputs ( file, s, ls, istat )
!
      end subroutine funx_fputs_0
!
!-----
!
      subroutine  funx_fputs ( file, s, ls, istat ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_size_t),intent(in)  :: ls
      character(len=ls),intent(in)        :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external :: f_fputs
!
!
      call f_fputs ( file, s, ls, istat )
!
      end subroutine funx_fputs
!
!-----
!
      subroutine  funx_fputs_array ( file, s, ls, istat ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_size_t),intent(in)  :: ls
      character,dimension(ls),intent(in)  :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external :: f_fputs
!     external :: f_fputs_array 
!
!
      call f_fputs ( file, s(1), ls, istat ) ! equiv 
!     call f_fputs_array ( file, s(1), ls, istat )
!
      end subroutine funx_fputs_array 
!
!-----
!
      subroutine  funx_fputs_intref_0 ( iptr, s, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int, ck_size_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      character(len=*),intent(in)            :: s 
      integer(kind=ck_int),intent(out)       :: istat  
!
      external ::                f_fputs_intref
      integer(kind=ck_size_t)    ls
!
!
      ls = len_trim(s)
      call f_fputs_intref ( iptr, s, ls, istat )
!
      end subroutine funx_fputs_intref_0
!
!-----
!
      subroutine  funx_fputs_intref ( iptr, s, ls, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      integer(kind=ck_size_t),intent(in)     :: ls
      character(len=ls),intent(in)           :: s 
      integer(kind=ck_int),intent(out)       :: istat  
!
      external :: f_fputs_intref
!
!
      call f_fputs_intref ( iptr, s, ls, istat )
!
      end subroutine funx_fputs_intref
!
!-----
!
      subroutine  funx_fputs_intref_array ( iptr, s, ls, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int, ck_size_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_size_t),intent(in)     :: ls
      character,dimension(ls),intent(in)     :: s 
      integer(kind=ck_int),intent(out)       :: istat  
!
      external :: f_fputs_intref
!     external :: f_fputs_intref_array
!
!
      call f_fputs_intref ( iptr, s(1), ls, istat )   ! equiv 
!     call f_fputs_intref_array ( iptr, s(1), ls, istat )
!
      end subroutine funx_fputs_intref_array
!
!-----
!
      subroutine  funx_fputs_stdout_0 ( s, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t
      implicit none 
!
      character(len=*),intent(in)      :: s 
      integer(kind=ck_int),intent(out) :: istat  
!
      external ::                f_fputs_stdout 
      integer(kind=ck_size_t)    ls 
!
!
      ls = len_trim(s)
      call f_fputs_stdout ( s, ls, istat )
!
      end subroutine funx_fputs_stdout_0
!
!-----
!
      subroutine  funx_fputs_stdout ( s, ls, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t
      implicit none 
!
      integer(kind=ck_size_t),intent(in)  :: ls
      character(len=ls),intent(in)        :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external :: f_fputs_stdout 
!
!
      call f_fputs_stdout ( s, ls, istat )
!
      end subroutine funx_fputs_stdout 
!
!-----
!
      subroutine  funx_fputs_stdout_array ( s, ls, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t 
      implicit none 
!
      integer(kind=ck_size_t),intent(in)  :: ls
      character,dimension(ls),intent(in)  :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external :: f_fputs_stdout
!     external :: f_fputs_stdout_array 
!
!
      call f_fputs_stdout ( s(1), ls, istat ) ! equiv 
!     call f_fputs_stdout_array ( s(1), ls, istat )
!
      end subroutine funx_fputs_stdout_array
!
!-----
!
      subroutine  funx_fputs_stderr_0 ( s, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t
      implicit none 
!
      character(len=*),intent(in)      :: s 
      integer(kind=ck_int),intent(out) :: istat  
!
      external ::                f_fputs_stderr 
      integer(kind=ck_size_t)    ls 
!
!
      ls = len_trim(s)
      call f_fputs_stderr ( s, ls, istat )
!
      end subroutine funx_fputs_stderr_0 
!
!-----
!
      subroutine  funx_fputs_stderr ( s, ls, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t
      implicit none 
!
      integer(kind=ck_size_t),intent(in)  :: ls
      character(len=ls),intent(in)        :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external :: f_fputs_stderr 
!
!
      call f_fputs_stderr ( s, ls, istat )
!
      end subroutine funx_fputs_stderr 
!
!-----
!
      subroutine  funx_fputs_stderr_array ( s, ls, istat ) 
!
      use mod_funx_param, only: ck_int, ck_size_t 
      implicit none 
!
      integer(kind=ck_size_t),intent(in)  :: ls
      character,dimension(ls),intent(in)  :: s 
      integer(kind=ck_int),intent(out)    :: istat  
!
      external :: f_fputs_stderr
!     external :: f_fputs_stderr_array 
!
!
      call f_fputs_stderr ( s(1), ls, istat )   ! equiv 
!     call f_fputs_stderr_array ( s(1), ls, istat )
!
      end subroutine funx_fputs_stderr_array 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fread_afloat ( file, ar, n, m, errno )
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_float, ck_int
      implicit none 
!
      type(ck_file),intent(in)                     :: file 
      integer(kind=ck_size_t),intent(in)           :: n 
      real(kind=ck_float),dimension(n),intent(out) :: ar 
      integer(kind=ck_size_t),intent(out)          :: m
      integer(kind=ck_int),intent(out)             :: errno
!
      external :: f_fread_afloat
!
      real(kind=ck_float),parameter :: rtiny = -tiny(1.0_ck_float)
      integer(kind=ck_size_t)    i
!
!
      do i = 1, n
         ar(i) = rtiny 
      enddo
!
      call funx_reseterr ( errno )
      call f_fread_afloat ( file, ar, n, m )
      call funx_geterrno ( errno )
!
      if ( m .eq. 0 ) then 
!
!        ar reads the stream partly
!
         do i = n, 1, -1
            if ( ar(i) .ne. rtiny ) exit 
         enddo
         m = i 
!
      else 
!
!        ar reads the stream fully 
!
         m = n 
!
      endif  
!
      end subroutine funx_fread_afloat
!
!-----
!
      subroutine  funx_fread_afloat_intref ( iptr, ar, n, m, errno )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_float, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)         :: iptr 
      integer(kind=ck_size_t),intent(in)           :: n 
      real(kind=ck_float),dimension(n),intent(out) :: ar 
      integer(kind=ck_size_t),intent(out)          :: m
      integer(kind=ck_int),intent(out)             :: errno
!
      external :: f_fread_afloat_intref
!
      real(kind=ck_float),parameter :: rtiny = -tiny(1.0_ck_float)
      integer(kind=ck_size_t)    i
!
!
      do i = 1, n
         ar(i) = rtiny 
      enddo
!
      call funx_reseterr ( errno )
      call f_fread_afloat_intref ( iptr, ar, n, m )
      call funx_geterrno ( errno )
!
      if ( m .eq. 0 ) then 
!
!        ar reads the stream partly
!
         do i = n, 1, -1
            if ( ar(i) .ne. rtiny ) exit 
         enddo
         m = i 
!
      else 
!
!        ar reads the stream fully 
!
         m = n 
!
      endif  
!
      end subroutine funx_fread_afloat_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fread_astr ( &
                  file, astr, len_astr, lentrim_astr, errno ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_size_t),intent(in)  :: len_astr
      character(len=len_astr),intent(out) :: astr 
      integer(kind=ck_size_t),intent(out) :: lentrim_astr 
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_fread_astr
!
!
      call funx_reseterr ( errno )
      call f_fread_astr ( file, astr, len_astr, lentrim_astr ) 
      call funx_geterrno ( errno )
! 
      end subroutine funx_fread_astr
!
!-----
!
      subroutine  funx_fread_astr_array ( &
                  file, astr, len_astr, lentrim_astr, errno ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)                  :: file 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(out) :: astr 
      integer(kind=ck_size_t),intent(out)       :: lentrim_astr 
      integer(kind=ck_int),intent(out)          :: errno
!
      external :: f_fread_astr
!     external :: f_fread_astr_array 
!
!
      call funx_reseterr ( errno )
      call f_fread_astr ( file, astr(1), len_astr, lentrim_astr ) 
!     call f_fread_astr_array ( file, astr, len_astr, lentrim_astr ) 
      call funx_geterrno ( errno )
! 
      end subroutine funx_fread_astr_array 
!
!-----
!
      subroutine  funx_fread_astr_intref ( &
                  iptr, astr, len_astr, lentrim_astr, errno ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_size_t),intent(in)     :: len_astr
      character(len=len_astr),intent(out)    :: astr 
      integer(kind=ck_size_t),intent(out)    :: lentrim_astr 
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_fread_astr_intref
!
!
      call funx_reseterr ( errno )
      call f_fread_astr_intref ( &
           iptr, astr, len_astr, lentrim_astr ) 
      call funx_geterrno ( errno )
!
      end subroutine funx_fread_astr_intref
!
!-----
!
      subroutine  funx_fread_astr_intref_array ( &
                  iptr, astr, len_astr, lentrim_astr, errno ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)      :: iptr 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(out) :: astr 
      integer(kind=ck_size_t),intent(out)       :: lentrim_astr 
      integer(kind=ck_int),intent(out)          :: errno
!
      external :: f_fread_astr_intref
!     external :: f_fread_astr_intref_array
!
!
      call funx_reseterr ( errno )
      call f_fread_astr_intref ( &
!     call f_fread_astr_intref_array ( &
           iptr, astr(1), len_astr, lentrim_astr ) 
      call funx_geterrno ( errno )
!
      end subroutine funx_fread_astr_intref_array
!
!-----------------------------------------------------------------------
!
      subroutine  funx_frewind ( file ) 
!
      use mod_funx_param, only: ck_file 
      implicit none 
!
      type(ck_file),intent(in) :: file 
!
      external :: f_frewind 
!
!
      call f_frewind ( file )
!
      end subroutine funx_frewind
!
!-----
!
      subroutine  funx_frewind_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t 
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
!
      external :: f_frewind_intref 
!
!
      call f_frewind_intref ( iptr )
!
      end subroutine funx_frewind_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fseek ( file, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_file, ck_long, ck_int
      implicit none 
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_long),intent(in) :: offset 
      integer(kind=ck_int),intent(in)  :: whence 
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_fseek 
!
!
      call f_fseek ( file, offset, whence, istat )
!
      end subroutine funx_fseek
!
!-----
!
      subroutine  funx_fseek_intref ( iptr, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_long, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr  
      integer(kind=ck_long),intent(in) :: offset 
      integer(kind=ck_int),intent(in)  :: whence 
      integer(kind=ck_int),intent(out) :: istat
!
      external :: f_fseek_intref 
!
!
      call f_fseek_intref ( iptr, offset, whence, istat )
!
      end subroutine funx_fseek_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fseeko ( file, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_file, ck_off_t, ck_int
      implicit none 
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_off_t),intent(in)   :: offset 
      integer(kind=ck_int),intent(in)     :: whence 
      integer(kind=ck_int),intent(out)    :: istat
!
      external :: f_fseeko 
!
!
      call f_fseeko ( file, offset, whence, istat )
!
      end subroutine funx_fseeko
!
!-----
!
      subroutine  funx_fseeko_intref ( iptr, offset, whence, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_off_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_off_t),intent(in)      :: offset 
      integer(kind=ck_int),intent(in)        :: whence 
      integer(kind=ck_int),intent(out)       :: istat
!
      external :: f_fseeko_intref 
!
!
      call f_fseeko_intref ( iptr, offset, whence, istat )
!
      end subroutine funx_fseeko_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fsetpos ( file, pos ) 
!
      use mod_funx_param, only: ck_file, ck_fpos_t
      implicit none 
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_fpos_t),intent(in)  :: pos
!
      external :: f_fsetpos 
!
!
      call f_fsetpos ( file, pos )
!
      end subroutine funx_fsetpos
!
!-----
!
      subroutine  funx_fsetpos_intref ( iptr, pos ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_fpos_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_fpos_t),intent(in)     :: pos
!
      external :: f_fsetpos_intref 
!
!
      call f_fsetpos_intref ( iptr, pos )
!
      end subroutine funx_fsetpos_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fstderr ( file ) 
!
      use mod_funx_param, only: ck_file
      implicit none 
!
      type(ck_file),intent(out) :: file 
!
      external :: f_fstderr
!
!
      call f_fstderr ( file )
!
      end subroutine funx_fstderr
!
!-----
!
      subroutine  funx_fstderr_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(out) :: iptr 
!
      external :: f_fstderr_intref
!
!
      call f_fstderr_intref ( iptr )
!
      end subroutine funx_fstderr_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fstdin ( file ) 
!
      use mod_funx_param, only: ck_file
      implicit none 
!
      type(ck_file),intent(out) :: file 
!
      external :: f_fstdin 
!
!
      call f_fstdin ( file )
!
      end subroutine funx_fstdin 
!
!-----
!
      subroutine  funx_fstdin_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(out) :: iptr
!
      external :: f_fstdin_intref 
!
!
      call f_fstdin_intref ( iptr )
!
      end subroutine funx_fstdin_intref 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fstdout ( file ) 
!
      use mod_funx_param, only: ck_file
      implicit none 
!
      type(ck_file),intent(inout) :: file 
!
      external :: f_fstdout
!
!
      call f_fstdout ( file )
!
      end subroutine funx_fstdout
!
!-----
!
      subroutine  funx_fstdout_intref ( iptr ) 
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(inout) :: iptr 
!
      external :: f_fstdout_intref
!
!
      call f_fstdout_intref ( iptr )
!
      end subroutine funx_fstdout_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_ftell ( file, pos ) 
!
      use mod_funx_param, only: ck_file, ck_long 
      implicit none 
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_long),intent(out)   :: pos
!
      external :: f_ftell 
!
!
      call f_ftell ( file, pos )
!
      end subroutine funx_ftell
!
!-----
!
      subroutine  funx_ftell_intref ( iptr, pos ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_long 
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      integer(kind=ck_long),intent(out)      :: pos
!
      external :: f_ftell_intref 
!
!
      call f_ftell_intref ( iptr, pos )
!
      end subroutine funx_ftell_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_ftello ( file, pos ) 
!
      use mod_funx_param, only: ck_file, ck_off_t
      implicit none 
!
      type(ck_file),intent(inout)         :: file 
      integer(kind=ck_off_t),intent(out)  :: pos
!
      external :: f_ftello 
!
!
      call f_ftello ( file, pos )
!
      end subroutine funx_ftello
!
!-----
!
      subroutine  funx_ftello_intref ( iptr, pos ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_off_t
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr
      integer(kind=ck_off_t),intent(out)     :: pos
!
      external :: f_ftello_intref 
!
!
      call f_ftello_intref ( iptr, pos )
!
      end subroutine funx_ftello_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fwrite_afloat ( file, ar, n, m, errno )
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_float, ck_int
      implicit none 
!
      type(ck_file),intent(in)                     :: file 
      integer(kind=ck_size_t),intent(in)           :: n 
      real(kind=ck_float),dimension(n),intent(in)  :: ar 
      integer(kind=ck_size_t),intent(out)          :: m
      integer(kind=ck_int),intent(out)             :: errno
!
      external :: f_fwrite_afloat
!
!
      call funx_reseterr ( errno )
      call f_fwrite_afloat ( file, ar, n, m )
      call funx_geterrno ( errno )
!
      end subroutine funx_fwrite_afloat
!
!-----
!
      subroutine  funx_fwrite_afloat_intref ( iptr, ar, n, m, errno )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_float, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)         :: iptr
      integer(kind=ck_size_t),intent(in)           :: n 
      real(kind=ck_float),dimension(n),intent(in)  :: ar 
      integer(kind=ck_size_t),intent(out)          :: m
      integer(kind=ck_int),intent(out)             :: errno
!
      external :: f_fwrite_afloat_intref
!
!
      call funx_reseterr ( errno )
      call f_fwrite_afloat_intref ( iptr, ar, n, m )
      call funx_geterrno ( errno )
!
      end subroutine funx_fwrite_afloat_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_fwrite_astr ( &
                  file, astr, len_astr, m, errno ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)               :: file 
      integer(kind=ck_size_t),intent(in)     :: len_astr
      character(len=len_astr),intent(in)     :: astr 
      integer(kind=ck_size_t),intent(out)    :: m 
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_fwrite_astr
!
!
      call funx_reseterr ( errno )
      call f_fwrite_astr ( file, astr, len_astr, m )
      call funx_geterrno ( errno )
!
      end subroutine funx_fwrite_astr
!
!-----
!
      subroutine  funx_fwrite_astr_array ( &
                  file, astr, len_astr, m, errno ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
      type(ck_file),intent(in)                  :: file 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(in)  :: astr 
      integer(kind=ck_size_t),intent(out)       :: m 
      integer(kind=ck_int),intent(out)          :: errno
!
      external :: f_fwrite_astr
!     external :: f_fwrite_astr_array
!
!
      call funx_reseterr ( errno )
      call f_fwrite_astr ( file, astr(1), len_astr, m )
!     call f_fwrite_astr_array ( file, astr(1), len_astr, m )
      call funx_geterrno ( errno )
!
      end subroutine funx_fwrite_astr_array
!
!-----
!
      subroutine  funx_fwrite_astr_intref ( &
                  iptr, astr, len_astr, m, errno ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_size_t),intent(in)     :: len_astr
      character(len=len_astr),intent(in)     :: astr 
      integer(kind=ck_size_t),intent(out)    :: m 
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_fwrite_astr_intref
!
!
      call funx_reseterr ( errno )
      call f_fwrite_astr_intref ( iptr, astr, len_astr, m )
      call funx_geterrno ( errno )
!
      end subroutine funx_fwrite_astr_intref
!
!-----
!
      subroutine  funx_fwrite_astr_intref_array ( &
                  iptr, astr, len_astr, m, errno ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)      :: iptr 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(in)  :: astr 
      integer(kind=ck_size_t),intent(out)       :: m 
      integer(kind=ck_int),intent(out)          :: errno
!
      external :: f_fwrite_astr_intref
!     external :: f_fwrite_astr_intref_array
!
!
      call funx_reseterr ( errno )
      call f_fwrite_astr_intref ( iptr, astr(1), len_astr, m )
!     call f_fwrite_astr_intref_array ( iptr, astr, len_astr, m )
      call funx_geterrno ( errno )
!
      end subroutine funx_fwrite_astr_intref_array
!
!-----------------------------------------------------------------------
!
      subroutine  funx_getchar ( c ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(out) :: c 
!
      external :: f_getchar
!
!
      call f_getchar ( c )
!
      end subroutine funx_getchar
!
!-----------------------------------------------------------------------
!
      subroutine  funx_getenv ( &
                  envn, envv, len_envv, lentrim_envv, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)            :: envn
      integer(kind=ck_size_t),intent(in)     :: len_envv
      character(len=len_envv),intent(inout)  :: envv
      integer(kind=ck_size_t),intent(out)    :: lentrim_envv 
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_getenv
!
!
      call funx_reseterr ( errno )
      call f_getenv ( envn, envv, len_envv, lentrim_envv )
      call funx_geterrno ( errno )
!
      end subroutine funx_getenv
!
!-----
!
      subroutine  funx_getenv_array ( &
                  envn, envv, len_envv, lentrim_envv, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)               :: envn
      integer(kind=ck_size_t),intent(in)        :: len_envv
      character,dimension(len_envv),intent(out) :: envv
      integer(kind=ck_size_t),intent(out)       :: lentrim_envv 
      integer(kind=ck_int),intent(out)          :: errno
!
      external :: f_getenv_array
!
!
      call funx_reseterr ( errno )
      call f_getenv_array ( envn, envv, len_envv, lentrim_envv )
      call funx_geterrno ( errno )
!
      end subroutine funx_getenv_array
!------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  funx_getenv_alloc ( envn, envv, len_envv, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)                     :: envn
      character,dimension(:),allocatable,intent(out)  :: envv
      integer(kind=ck_size_t),intent(out)             :: len_envv 
      integer(kind=ck_int),intent(out)                :: errno
!
      interface 
         subroutine  f_getenv_alloc ( wenvn, wenvv, wlen_envv )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)                     :: wenvn
         character,dimension(:),allocatable,intent(out)  :: wenvv
         integer(kind=ck_size_t),intent(out)             :: wlen_envv 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_getenv_alloc ( envn, envv, len_envv )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_getenv_alloc
!
!------
!
!     We work with dynchatable character (f2003 enhance).
!
!-----
      subroutine  funx_getenv_dynch ( envn, envv, len_envv, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)               :: envn
      character(len=:),allocatable,intent(out)  :: envv
      integer(kind=ck_size_t),intent(out)       :: len_envv 
      integer(kind=ck_int),intent(out)          :: errno
!
      interface 
         subroutine  f_getenv_dynch ( wenvn, wenvv, wlen_envv )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)               :: wenvn
         character(len=:),allocatable,intent(out)  :: wenvv
         integer(kind=ck_size_t),intent(out)       :: wlen_envv 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_getenv_dynch ( envn, envv, len_envv )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_getenv_dynch
!
!-----------------------------------------------------------------------
!
      subroutine  funx_link ( src, des, errno )
!
      use mod_funx_param, only: ck_int 
      implicit none 
!
      character(len=*),intent(in)      :: src, des
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_link 
!
!
      call funx_reseterr ( errno )
      call f_link ( src, des )
      call funx_geterrno ( errno )
!
      end subroutine funx_link
!
!-----------------------------------------------------------------------
!
      subroutine  funx_mkdir ( path, errno )
!  
      use mod_funx_param, only: ck_mode_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_mkdir_decf
      integer(kind=ck_mode_t)    mdec
!
!     Default setting: 
!        decimal form:  484, 
!        octal form:    744, 
!        permision:     rwxr--r--
!
      call funx_reseterr ( errno )
      mdec = 484 
      call f_mkdir_decf ( path, mdec )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkdir
!
!-----
!
      subroutine  funx_mkdir_decf ( path, mdec, errno )
!  
      use mod_funx_param, only: ck_mode_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: mdec
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_mkdir_decf 
!
!
      call funx_reseterr ( errno )
      call f_mkdir_decf ( path, mdec )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkdir_decf
!
!-----
!
      subroutine  funx_mkdir_octf ( path, moct, errno )
!  
      use mod_funx_param, only: ck_mode_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: moct
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_mkdir_octf
!
      call funx_reseterr ( errno )
      call f_mkdir_octf ( path, moct )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkdir_octf
!
!-----
!
!     Next, let us define subroutine working with mask in the character
!     form:
!           
!           123456789
!           ---------
!     fmt= 'rwxrwxrwx'
!           ---___---         
!            U  G  O       U:user, G:group, O:others
!
!     For example, with the input mask
!
!     fmt = 'rwxr--r--'
!
!     the output directory has persission: 
!     +  User (onwer) can read, write, execute
!     +  Group can read only.
!     +  Others can only read.
!
!
      subroutine  funx_mkdir_perm ( path, perm, errno )
!  
      use mod_funx_param, only: ck_int 
      implicit none 
!
      character(len=*),intent(in)      :: path
      character(len=*),intent(in)      :: perm 
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_mkdir_perm  
!
!
      call funx_reseterr ( errno )
      call f_mkdir_perm ( path, perm )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkdir_perm 
!
!-----------------------------------------------------------------------
!
!     Default 
!
      subroutine  funx_mkpath ( path, errno )
!  
      use mod_funx_param, only: ck_mode_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_mkpath_decf
      integer(kind=ck_mode_t)    mdec
!
!     Default setting: 
!        decimal form:  484, 
!        octal form:    744, 
!        permision:     rwxr--r--
!
      call funx_reseterr ( errno )
      mdec = 484 
      call f_mkpath_decf ( path, mdec )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkpath
!
!-----
!
!     mode of directory is given as an integer with octal value.
!
      subroutine  funx_mkpath_octf ( path, moct, errno )
!  
      use mod_funx_param, only: ck_mode_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: moct
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_mkpath_octf
!
      call funx_reseterr ( errno )
      call f_mkpath_octf ( path, moct )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkpath_octf
!
!-----------------------------------------------------------------------
!
!     mode of directory is given as an integer with decimal value.
!
      subroutine  funx_mkpath_decf ( path, mdec, errno )
!  
      use mod_funx_param, only: ck_mode_t, ck_int 
      implicit none 
!
      character(len=*),intent(in)         :: path
      integer(kind=ck_mode_t),intent(in)  :: mdec
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_mkpath_decf 
!
!
      call funx_reseterr ( errno )
      call f_mkpath_decf ( path, mdec )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkpath_decf
!
!-----
!
!     Next, let us define subroutine working with mask in the character
!     form:
!           
!           123456789
!           ---------
!     fmt= 'rwxrwxrwx'
!           ---___---         
!            U  G  O       U:user, G:group, O:others
!
!     For example, with the input mask
!
!     fmt = 'rwxr--r--'
!
!     the output directory has persission: 
!     +  User (onwer) can read, write, execute
!     +  Group can read only.
!     +  Others can only read.
!
!
      subroutine  funx_mkpath_perm ( path, perm, errno )
!  
      use mod_funx_param, only: ck_int 
      implicit none 
!
      character(len=*),intent(in)      :: path
      character(len=*),intent(in)      :: perm 
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_mkpath_perm  
!
!
      call funx_reseterr ( errno )
      call f_mkpath_perm ( path, perm )
      call funx_geterrno ( errno )
!
      end subroutine funx_mkpath_perm 
!
!-----------------------------------------------------------------------
!
      subroutine  funx_opendir ( dirname, dir, errno )
!
      use mod_funx_param, only: ck_dir, ck_int
      implicit none 
!
      character(len=*),intent(in)      :: dirname
      type(ck_dir),intent(inout)       :: dir
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_opendir 
!
!
      call funx_reseterr ( errno )
      call f_opendir ( dirname, dir )
      call funx_geterrno ( errno )
!
      end subroutine funx_opendir
!
!-----
!
      subroutine  funx_opendir_intref ( dirname, iptr, errno )
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      character(len=*),intent(in)            :: dirname
      integer(kind=ck_intptr_t),intent(out)  :: iptr 
      integer(kind=ck_int),intent(out)       :: errno
!
      external :: f_opendir_intref  
!
      call funx_reseterr ( errno )
      call f_opendir_intref ( dirname, iptr )
      call funx_geterrno ( errno )
!
      end subroutine funx_opendir_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_pclose ( file, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
      type(ck_file),intent(inout)      :: file 
      integer(kind=ck_int),intent(out) :: istat 
!
      external :: f_pclose 
!
!
      call f_pclose ( file, istat )
!
      end subroutine funx_pclose
!
!-----
!
      subroutine  funx_pclose_intref ( iptr, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(out)     :: istat 
!
      external :: f_pclose_intref 
!
!
      call f_pclose_intref ( iptr, istat )
!
      end subroutine funx_pclose_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_popen ( file, command, mode, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int 
      implicit none 
!
      type(ck_file),intent(inout)   :: file 
      character(len=*),intent(in)   :: command 
      character(len=*),intent(in)   :: mode 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_popen 
!
!
      call f_popen ( file, command, mode, istat )
!
      end subroutine funx_popen
!
!-----
!
      subroutine  funx_popen_intref ( iptr, command, mode, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(out) :: iptr 
      character(len=*),intent(in)   :: command 
      character(len=*),intent(in)   :: mode 
      integer(kind=ck_int),intent(out) :: istat  
!
      external :: f_popen_intref 
!
!
      call f_popen_intref ( iptr, command, mode, istat )
!
      end subroutine funx_popen_intref
!
!-----------------------------------------------------------------------
!
      function    funx_is_dir ( path )  result ( res )
! 
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_dir
      logical     f_is_dir 
!
      res = f_is_dir ( path )
!
      end function funx_is_dir 
!
!-----
!
      function    funx_is_reg ( path )  result ( res )
!  
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_reg
      logical     f_is_reg 
!
!
      res = f_is_reg ( path )
!
      end function funx_is_reg 
!
!-----
!
      function    funx_is_blkdev ( path )  result ( res )
!  
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_blkdev
      logical     f_is_blkdev
!
!
      res = f_is_blkdev ( path )
!
      end function funx_is_blkdev 
!
!-----
!
      function    funx_is_chrdev ( path )  result ( res )
!
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_chrdev
      logical     f_is_chrdev
!
!
      res = f_is_chrdev ( path )
!
      end function funx_is_chrdev 
!
!-----
!
      function    funx_is_fifo ( path )  result ( res )
! 
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_fifo
      logical     f_is_fifo
!
!
      res = f_is_fifo ( path )
!
      end function funx_is_fifo 
!
!-----
!
      function    funx_is_socket ( path )  result ( res )
!
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_socket
      logical     f_is_socket
!
!
      res = f_is_socket ( path )
!
      end function funx_is_socket 
!
!-----
!
      function    funx_is_link ( path )  result ( res )
!  
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_link
      logical     f_is_link
!
!
      res = f_is_link ( path )
!
      end function funx_is_link 
!
!-----
!
      function    funx_is_exist ( path )  result ( res )
!
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_exist
      logical     f_is_exist
!
!
      res = f_is_exist ( path )
!
      end function funx_is_exist 
!
!-----
!
      function    funx_is_r_ok ( path )  result ( res )
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_r_ok
      logical     f_is_r_ok
!
!
      res = f_is_r_ok ( path )
!
      end function funx_is_r_ok
!
!-----
!  
!     is path writable ? based on the current UID and GID 
!
!
      function    funx_is_w_ok ( path )  result ( res )
!  
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_w_ok
      logical     f_is_w_ok
!
!
      res =  f_is_w_ok ( path )
!
      end function funx_is_w_ok
!
!-----
!  
!     is path executable ? based on the current UID and GID 
!
!
      function    funx_is_x_ok ( path )  result ( res )
!  
      implicit none 
!
      logical     res
      character(len=*),intent(in) :: path
!
      external :: f_is_x_ok
      logical     f_is_x_ok
!
!
      res = f_is_x_ok ( path )
!
      end function funx_is_x_ok
!
!-----------------------------------------------------------------------
!
      subroutine  funx_putchar ( c, istat ) 
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      integer(kind=ck_int),intent(in)  :: c 
      integer(kind=ck_int),intent(out) :: istat 
!
      external :: f_putchar
!
!
      call f_putchar ( c, istat )
!
      end subroutine funx_putchar
!
!-----------------------------------------------------------------------
!
!     It's best to set SIZE_FNAME = CK_NAME_MAX
!
!
      subroutine  funx_readdir ( &
                  dir, fname, size_fname, lentrim_fname, errno )
!
      use mod_funx_param, only: ck_dir, ck_size_t, ck_int  
      implicit none 
!
      type(ck_dir),intent(inout)            :: dir
      integer(kind=ck_size_t),intent(in)    :: size_fname
      character(len=size_fname),intent(out) :: fname
      integer(kind=ck_size_t),intent(out)   :: lentrim_fname
      integer(kind=ck_int),intent(out)      :: errno
!
      external :: f_readir 
!
!
      call funx_reseterr ( errno )
      call f_readdir ( dir, fname, size_fname, lentrim_fname )
      call funx_geterrno ( errno )
!
      end subroutine funx_readdir
!
!-----
!
      subroutine  funx_readdir_array ( &
                  dir, fname, size_fname, lentrim_fname, errno )
!
      use mod_funx_param, only: ck_dir, ck_size_t, ck_int  
      implicit none 
!
      type(ck_dir),intent(inout)                  :: dir
      integer(kind=ck_size_t),intent(in)          :: size_fname
      character,dimension(size_fname),intent(out) :: fname
      integer(kind=ck_size_t),intent(out)         :: lentrim_fname
      integer(kind=ck_int),intent(out)            :: errno
!
      external :: f_readir 
!
!
      call funx_reseterr ( errno )
      call f_readdir ( dir, fname(1), size_fname, lentrim_fname )
      call funx_geterrno ( errno )
!
      end subroutine funx_readdir_array 
!
!-----
!
      subroutine  funx_readdir_intref ( &
                  iptr, fname, size_fname, lentrim_fname, errno )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int 
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)  :: iptr 
      integer(kind=ck_size_t),intent(in)    :: size_fname
      character(len=size_fname),intent(out) :: fname
      integer(kind=ck_size_t),intent(out)   :: lentrim_fname
      integer(kind=ck_int),intent(out)      :: errno
!
      external :: f_readir_intref
!
!
      call funx_reseterr ( errno )
      call f_readdir_intref ( iptr, fname, size_fname, lentrim_fname )
      call funx_geterrno ( errno )
!
      end subroutine funx_readdir_intref
!
!-----
!
      subroutine  funx_readdir_intref_array ( &
                  iptr, fname, size_fname, lentrim_fname, errno )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int 
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in)        :: iptr 
      integer(kind=ck_size_t),intent(in)          :: size_fname
      character,dimension(size_fname),intent(out) :: fname
      integer(kind=ck_size_t),intent(out)         :: lentrim_fname
      integer(kind=ck_int),intent(out)            :: errno
!
      external :: f_readir_intref
!
!
      call funx_reseterr ( errno )
      call  f_readdir_intref ( &
            iptr, fname(1), size_fname, lentrim_fname )
      call funx_geterrno ( errno )
!
      end subroutine funx_readdir_intref_array 
!
!-----------------------------------------------------------------------
!
!     It's best to set SIZE_PATH = CK_PATH_MAX
!
!
      subroutine  funx_readlink ( &
                  fname, path, size_path, lentrim_path, errno ) 
! 
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)          :: fname
      integer(kind=ck_size_t),intent(in)   :: size_path
      character(len=size_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)  :: lentrim_path 
      integer(kind=ck_int),intent(out)     :: errno
!
      external :: f_readlink 
!
!
      call funx_reseterr ( errno )
      call f_readlink ( fname, path, size_path, lentrim_path )
      call funx_geterrno ( errno )
!
      end subroutine funx_readlink
!
!-----
!
      subroutine  funx_readlink_array ( &
                  fname, path, size_path, lentrim_path, errno ) 
! 
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)                :: fname
      integer(kind=ck_size_t),intent(in)         :: size_path
      character,dimension(size_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)        :: lentrim_path 
      integer(kind=ck_int),intent(out)           :: errno
!
      external :: f_readlink 
!
!
      call funx_reseterr ( errno )
      call f_readlink ( fname, path(1), size_path, lentrim_path )
      call funx_geterrno ( errno )
!
      end subroutine funx_readlink_array
!
!------
!
!     We work with allocatable array of character. SIZE_PATH is output.
!
!-----
      subroutine  funx_readlink_alloc ( fname, path, size_path, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)                    :: fname
      character,dimension(:),allocatable,intent(out) :: path
      integer(kind=ck_size_t),intent(out)            :: size_path 
      integer(kind=ck_int),intent(out)               :: errno
!
      interface 
         subroutine  f_readlink_alloc ( wfname, wpath, wsize_path )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)                     :: wfname
         character,dimension(:),allocatable,intent(out)  :: wpath
         integer(kind=ck_size_t),intent(out)             :: wsize_path 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_readlink_alloc ( fname, path, size_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_readlink_alloc
!
!------
!
!     We work with allocatable character (f2003 enhance)
!
!-----
      subroutine  funx_readlink_dynch ( fname, path, size_path, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)              :: fname
      character(len=:),allocatable,intent(out) :: path
      integer(kind=ck_size_t),intent(out)      :: size_path 
      integer(kind=ck_int),intent(out)         :: errno
!
      interface 
         subroutine  f_readlink_dynch ( wfname, wpath, wsize_path )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)              :: wfname
         character(len=:),allocatable,intent(out) :: wpath
         integer(kind=ck_size_t),intent(out)      :: wsize_path 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_readlink_dynch ( fname, path, size_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_readlink_dynch
!
!-----------------------------------------------------------------------
!
!     It's best to set SIZE_PATH = CK_PATH_MAX
!
      subroutine  funx_relpath ( &
                  fname, path, size_path, lentrim_path, errno ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)          :: fname
      integer(kind=ck_size_t),intent(in)   :: size_path
      character(len=size_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)  :: lentrim_path 
      integer(kind=ck_int),intent(out)     :: errno
!
      external :: f_relpath 
!
!
      call funx_reseterr ( errno )
      call f_relpath ( fname, path, size_path, lentrim_path )
      call funx_geterrno ( errno )
!
      end subroutine funx_relpath 
!
!-----
!
      subroutine  funx_relpath_array ( &
                  fname, path, size_path, lentrim_path, errno ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)                :: fname
      integer(kind=ck_size_t),intent(in)         :: size_path
      character,dimension(size_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)        :: lentrim_path 
      integer(kind=ck_int),intent(out)           :: errno
!
      external :: f_relpath
!     external :: f_relpath_array  
!
!
      call funx_reseterr ( errno )
      call f_relpath ( fname, path(1), size_path, lentrim_path )
!     call f_relpath_array ( fname, path(1), size_path, lentrim_path )
      call funx_geterrno ( errno )
!
      end subroutine funx_relpath_array 
!
!------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  funx_relpath_alloc ( fname, path, size_path, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)                     :: fname
      character,dimension(:),allocatable,intent(out)  :: path
      integer(kind=ck_size_t),intent(out)             :: size_path 
      integer(kind=ck_int),intent(out)                :: errno
!
      interface 
         subroutine  f_relpath_alloc ( wfname, wpath, wsize_path )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)                     :: wfname
         character,dimension(:),allocatable,intent(out)  :: wpath
         integer(kind=ck_size_t),intent(out)             :: wsize_path 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_relpath_alloc ( fname, path, size_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_relpath_alloc
!
!------
!
!     We work with allocatable character (f2003 enhance).
!
!-----
      subroutine  funx_relpath_dynch ( fname, path, size_path, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      character(len=*),intent(in)              :: fname
      character(len=:),allocatable,intent(out) :: path
      integer(kind=ck_size_t),intent(out)      :: size_path 
      integer(kind=ck_int),intent(out)         :: errno
!
      interface 
         subroutine  f_relpath_dynch ( wfname, wpath, wsize_path )
         use mod_funx_param, only: ck_size_t
         implicit none 
         character(len=*),intent(in)              :: wfname
         character(len=:),allocatable,intent(out) :: wpath
         integer(kind=ck_size_t),intent(out)      :: wsize_path 
         end subroutine 
      end interface 
!
!
      call funx_reseterr ( errno )
      call f_relpath_dynch ( fname, path, size_path )
      call funx_geterrno ( errno )
!
      return 
      end subroutine funx_relpath_dynch
!
!-----------------------------------------------------------------------
!
      subroutine  funx_rewinddir ( dir, errno )
!
      use mod_funx_param, only: ck_dir, ck_int 
      implicit none 
!
      type(ck_dir),intent(inout)       :: dir
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_rewinddir 
!
!
      call funx_reseterr ( errno )
      call f_rewinddir ( dir )
      call funx_geterrno ( errno )
!
      end subroutine funx_rewinddir
!
!-----
!
      subroutine  funx_rewinddir_intref ( iptr, errno )
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
      integer(kind=ck_intptr_t),intent(in) :: iptr
      integer(kind=ck_int),intent(out)     :: errno
!
      external :: f_rewinddir_intref 
!
!
      call funx_reseterr ( errno )
      call f_rewinddir_intref ( iptr )
      call funx_geterrno ( errno )
!
      end subroutine funx_rewinddir_intref
!
!-----------------------------------------------------------------------
!
      subroutine  funx_rmdir ( path, errno )
!
      use mod_funx_param, only: ck_int 
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_rmdir 
!
!
      call funx_reseterr ( errno )
      call f_rmdir ( path )
      call funx_geterrno ( errno )
!
      end subroutine funx_rmdir
!
!-----------------------------------------------------------------------
!
      subroutine  funx_rmpath ( path, errno )
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_rmpath 
!
!
      call funx_reseterr ( errno )
      call f_rmpath ( path )
      call funx_geterrno ( errno )
!
      end subroutine funx_rmpath
!
!-----------------------------------------------------------------------
!
      subroutine  funx_strerror ( &
                  err, str, size_str, lentrim_str, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_int),intent(in)     :: err
      integer(kind=ck_size_t),intent(in)  :: size_str
      character(len=size_str),intent(out) :: str 
      integer(kind=ck_size_t),intent(out) :: lentrim_str
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_strerror
!
!
      call f_strerror ( err, str, size_str, lentrim_str, errno )
!
      end subroutine funx_strerror
!
!-----
!
      subroutine  funx_strerror_array ( &
                  err, str, size_str, lentrim_str, errno )
!
      use mod_funx_param, only: ck_size_t, ck_int
      implicit none 
!
      integer(kind=ck_int),intent(in)     :: err
      integer(kind=ck_size_t),intent(in)  :: size_str
      character,dimension(size_str),intent(out) :: str 
      integer(kind=ck_size_t),intent(out) :: lentrim_str
      integer(kind=ck_int),intent(out)    :: errno
!
      external :: f_strerror
!
!
      call f_strerror ( err, str(1), size_str, lentrim_str, errno )
!
      end subroutine funx_strerror_array
!
!-----------------------------------------------------------------------
!
      subroutine  funx_symlink ( src, des, errno )
!
      use mod_funx_param, only: ck_int 
      implicit none
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)      :: src, des
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_symlink
!
!
      call funx_reseterr ( errno )
      call f_symlink ( src, des )
      call funx_geterrno ( errno )
!
      end subroutine funx_symlink
!
!-----------------------------------------------------------------------
!
      subroutine  funx_time ( time ) 
!
      use mod_funx_param, only: ck_time_t
      implicit none 
!
      integer(kind=ck_time_t),intent(out) :: time 
!
      external :: f_time 
!
!
      call f_time ( time ) 
!
      end subroutine funx_time
!
!-----
!
      subroutine  funx_times ( utime, stime, cutime, cstime ) 
!
      use mod_funx_param, only: ck_clock_t
      implicit none 
!
      integer(kind=ck_clock_t),intent(out) ::  utime
      integer(kind=ck_clock_t),intent(out) ::  stime
      integer(kind=ck_clock_t),intent(out) ::  cutime
      integer(kind=ck_clock_t),intent(out) ::  cstime 
!
      external :: f_times 
!
!
      call f_times ( utime, stime, cutime, cstime )
!
      end subroutine funx_times
!
!-----------------------------------------------------------------------
!
      subroutine  funx_unlink ( path, errno )
!
      use mod_funx_param, only: ck_int
      implicit none 
!
      character(len=*),intent(in)      :: path
      integer(kind=ck_int),intent(out) :: errno
!
      external :: f_unlink 
!
!
      call funx_reseterr ( errno )
      call f_unlink ( path )
      call funx_geterrno ( errno )
!
      end subroutine funx_unlink
!
!
!-----------------------------------------------------------------------
!

!
!-----------------------------------------------------------------------
!

!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!

!=======================================================================
!
!     f_utils.f90: Level 2
!
!-----------------------------------------------------------------------
!
!     Take the length of sub-string that is the result from trimming the
!     input string. Furthermore, the procedure ensures that there is no
!     newline, carriage return, or null at the tail of the sub-string.
!
!-----
!
      subroutine  funx_strlentrim ( str, size_str, len_str )
!
      use mod_funx_param, only: ck_size_t
      implicit none
!
      integer(kind=ck_size_t),intent(in)  :: size_str
      character(len=size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out) :: len_str
!
      external :: f_utils_strlentrim
!
!
      call f_utils_strlentrim ( str, size_str, len_str )
!
      end subroutine funx_strlentrim
!
!-----
!
      subroutine  funx_strlentrim_array ( str, size_str, len_str )
!
      use mod_funx_param, only: ck_size_t
      implicit none
!
      integer(kind=ck_size_t),intent(in)        :: size_str
      character,dimension(size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out)       :: len_str
!
      external :: f_utils_strlentrim
!
!
      call f_utils_strlentrim ( str(1), size_str, len_str )
!
      end subroutine funx_strlentrim_array 
!
!-----
!
      subroutine  funx_strlencrop ( str, size_str, lentrim_str )
!
      use mod_funx_param, only: ck_size_t
      implicit none
!
      integer(kind=ck_size_t),intent(in)  :: size_str
      character(len=size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out) :: lentrim_str
!
      external :: f_utils_strlencrop
!
!
      call f_utils_strlencrop ( str, size_str, lentrim_str )
!
      end subroutine funx_strlencrop
!
!-----
!
      subroutine  funx_strlencrop_array ( str, size_str, lentrim_str )
!
      use mod_funx_param, only: ck_size_t
      implicit none
!
      integer(kind=ck_size_t),intent(in)        :: size_str
      character,dimension(size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out)       :: lentrim_str
!
      external :: f_utils_strlencrop
!
!
      call f_utils_strlencrop ( str(1), size_str, lentrim_str )
!
      end subroutine funx_strlencrop_array 
!
!-----------------------------------------------------------------------
!
!     Get memory reference / address of variables in some basic kinds
!
!-----------------------------------------------------------------------
!
!     For integer(4):
!
!-----
      subroutine  funx_vgetaddr_int ( var, ref )
!
      use mod_funx_param, only: ck_int, ck_intptr_t
      implicit none 
!
      integer(kind=ck_int),      intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external :: f_utils_vgetaddr_int
!
!
      call f_utils_vgetaddr_int ( var, ref )
!
      end subroutine  funx_vgetaddr_int
!-----------------------------------------------------------------------
!
!     For integer(8):
!
!-----
!
      subroutine  funx_vgetaddr_long ( var, ref )
!
      use mod_funx_param, only: ck_intptr_t, ck_long
      implicit none 
!
      integer(kind=ck_long),     intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external :: f_utils_vgetaddr_long
!
!
      call f_utils_vgetaddr_long ( var, ref )
!
      end subroutine  funx_vgetaddr_long
!-----------------------------------------------------------------------
!
!     For real(4):
!
!-----
!
      subroutine  funx_vgetaddr_float ( var, ref )
!
      use mod_funx_param, only: ck_float, ck_intptr_t
      implicit none 
!
      real(kind=ck_float),       intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external :: f_utils_vgetaddr_float
!
!
      call f_utils_vgetaddr_float ( var, ref )
!
      end subroutine  funx_vgetaddr_float
!-----------------------------------------------------------------------
!
!     For real(8):
!
!-----
!
      subroutine  funx_vgetaddr_double ( var, ref )
!
      use mod_funx_param, only: ck_double, ck_intptr_t
      implicit none 
!
      real(kind=ck_double),      intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external :: f_utils_vgetaddr_double
!
!
      call f_utils_vgetaddr_double ( var, ref )
!
      end subroutine  funx_vgetaddr_double 
!-----------------------------------------------------------------------
!
!     For character(1):
!
!-----
!
      subroutine  funx_vgetaddr_char ( var, ref )
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
      character(len=1),          intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external :: f_utils_vgetaddr_char
!
!
      call f_utils_vgetaddr_char ( var, ref )
!
      end subroutine  funx_vgetaddr_char  
!-----------------------------------------------------------------------
!
!     For character(*):
!
!-----
!
      subroutine  funx_vgetaddr_str  ( var, ref )
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
      character,dimension(:),    intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external :: f_utils_vgetaddr_char
!
!
      call f_utils_vgetaddr_char ( var(1), ref )
!
      end subroutine  funx_vgetaddr_str   
!
!-----------------------------------------------------------------------
!
!     Get value of a variable from its memory reference / address
!
!-----------------------------------------------------------------------
!
!     For integer(4):
!
!-----
      subroutine  funx_vgetinfo_int ( ref, var )
!
      use mod_funx_param, only: ck_int, ck_intptr_t
      implicit none 
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      integer(kind=ck_int),      intent(out) :: var 
!
      external :: f_utils_vgetinfo_int 
!
!
      call f_utils_vgetinfo_int ( ref, var )
! 
      end subroutine  funx_vgetinfo_int
!-----------------------------------------------------------------------
!
!     For integer(8):
!
!-----
      subroutine  funx_vgetinfo_long ( ref, var )
!
      use mod_funx_param, only: ck_long, ck_intptr_t
      implicit none
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      integer(kind=ck_long),     intent(out) :: var 
!
      external :: f_utils_vgetinfo_long 
!
!
      call f_utils_vgetinfo_long ( ref, var )
!
      end subroutine  funx_vgetinfo_long
!-----------------------------------------------------------------------
!
!     For real(4):   
!
!-----
      subroutine  funx_vgetinfo_float ( ref, var )
!
      use mod_funx_param, only: ck_float, ck_intptr_t
      implicit none 
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      real(kind=ck_float),       intent(out) :: var 
!
      external :: f_utils_vgetinfo_float 
!
!
      call f_utils_vgetinfo_float ( ref, var )
! 
      end subroutine  funx_vgetinfo_float
!-----------------------------------------------------------------------
!
!     For real(8):   
!
!-----
      subroutine  funx_vgetinfo_double ( ref, var )
!
      use mod_funx_param, only: ck_double, ck_intptr_t
      implicit none 
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      real(kind=ck_double),      intent(out) :: var 
!
      external :: f_utils_vgetinfo_double 
!
!
      call f_utils_vgetinfo_double ( ref, var )
! 
      end subroutine  funx_vgetinfo_double
!-----------------------------------------------------------------------
!
!     For character(len=*):
!
!-----
      subroutine  funx_vgetinfo_char ( &
                  ref, var, len_var, lentrim_var )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t
      implicit none 
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      integer(kind=ck_size_t), intent(in)    :: len_var
      character(len=len_var),intent(inout)   :: var 
      integer(kind=ck_size_t), intent(out)   :: lentrim_var
!
      external :: f_utils_vgetinfo_char 
!
!
      call f_utils_vgetinfo_char ( ref, var, len_var, lentrim_var )
! 
      end subroutine  funx_vgetinfo_char
!
!-----------------------------------------------------------------------
!
!     Convert permission among octal and decimal integers, or 
!     string form.
!
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!
      subroutine  funx_dec2oct ( idec, ioct )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      integer(kind=ck_mode_t),intent(in)   :: idec 
      integer(kind=ck_mode_t),intent(out)  :: ioct 
!
      external :: f_utils_dec2oct
!
!     511 --> 777
!
      call f_utils_dec2oct ( idec, ioct ) 
!
      end subroutine  funx_dec2oct
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!
      subroutine  funx_oct2dec ( ioct, idec )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      integer(kind=ck_mode_t),intent(in)   :: ioct 
      integer(kind=ck_mode_t),intent(out)  :: idec 
!
      external :: f_utils_oct2dec
!     777 --> 511 
!
      call f_utils_oct2dec ( ioct, idec ) 
!
      end subroutine  funx_oct2dec
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 10, i.e. 10 bytes.
!
!-----
      subroutine  funx_oct2per ( ioct, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      integer(kind=ck_mode_t),intent(in)  :: ioct 
      character(len=*),intent(inout)      :: str 
!
      external :: f_utils_oct2per 
!
!     777   --> rwxrwxrwx
!
      call f_utils_oct2per ( ioct, str ) 
!
      end subroutine  funx_oct2per
!-----------------------------------------------------------------------
!
      subroutine  funx_per2oct ( str, ioct )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: ioct 
!
      external :: f_utils_per2oct
!
!     rwxrwxrwx --> 777
!
      call f_utils_per2oct ( str, ioct )
!
      end subroutine  funx_per2oct
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 10, i.e. 10 bytes.
!
!-----
      subroutine  funx_dec2per ( ioct, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      integer(kind=ck_mode_t),intent(in)  :: ioct 
      character(len=*),intent(inout)      :: str 
!
      external :: f_utils_dec2per 
!
!     511   --> rwxrwxrwx
!
      call f_utils_dec2per ( ioct, str ) 
!
      end subroutine  funx_dec2per
!-----------------------------------------------------------------------
!
      subroutine  funx_per2dec ( str, ioct )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: ioct 
!
      external :: f_utils_per2dec
!
!     rwxrwxrwx --> 511
!
      call f_utils_per2dec ( str, ioct )
!
      end subroutine  funx_per2dec
!-----------------------------------------------------------------------
!
!     FUP:  Fully Unix Permission 
!
!     str = 'drwxrwxrwx UGS'
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
!
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 14, i.e. 14 bytes.
!
      subroutine  funx_oct2fup ( ioct, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      integer(kind=ck_mode_t),intent(in)  :: ioct 
      character(len=*),intent(inout)      :: str 
!
      external :: f_utils_oct2fup 
!
!     777   --> rwxrwxrwx
!
      call f_utils_oct2fup ( ioct, str ) 
!
      end subroutine  funx_oct2fup
!-----------------------------------------------------------------------
!
      subroutine  funx_fup2oct ( str, ioct )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: ioct 
!
      external :: f_utils_fup2oct
!
!     rwxrwxrwx --> 777
!
      call f_utils_fup2oct ( str, ioct )
!
      end subroutine  funx_fup2oct
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 14, i.e. 14 bytes.
!
      subroutine  funx_dec2fup ( idec, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      integer(kind=ck_mode_t),intent(in)  :: idec 
      character(len=*),intent(inout)      :: str 
!
      external :: f_utils_dec2fup 
!
!     511   --> rwxrwxrwx
!
      call f_utils_dec2fup ( idec, str ) 
!
      end subroutine  funx_dec2fup
!-----------------------------------------------------------------------
!
      subroutine  funx_fup2dec ( str, idec )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: idec 
!
      external :: f_utils_fup2dec
!
!     rwxrwxrwx --> 511
!
      call f_utils_fup2dec ( str, idec )
!
      end subroutine  funx_fup2dec
!-----------------------------------------------------------------------
!
!
!
      subroutine  funx_scalebyte ( isize, rsize, unitstr ) 
!
      use mod_funx_param, only: ck_off_t, ck_float
      implicit none
!
      integer(ck_off_t),intent(in)  :: isize
      real(ck_float),intent(out)    :: rsize
      character(len=3),intent(out)  :: unitstr
!
      external :: f_utils_scalebyte
!
!
      call f_utils_scalebyte ( isize, rsize, unitstr )
!
      end subroutine funx_scalebyte 
!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!




!
!-----------------------------------------------------------------------
!



!
!-----------------------------------------------------------------------
!
!
!-----------------------------------------------------------------------
!

!
!-----------------------------------------------------------------------
!

!
!-----------------------------------------------------------------------
!


!
!-----------------------------------------------------------------------
!

!
!-----------------------------------------------------------------------
!

!
!-----------------------------------------------------------------------
!

!
!-----------------------------------------------------------------------
!
      end module mod_funx_faces
!-----------------------------------------------------------------------
