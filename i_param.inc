!     
!     THE FOLLOWING CONTENT IS GENERATED FROM e_param.c
!     EDITTING IT YOU'LL GET WHAT YOU ARE DESERVED.
!     
!     
!     character(len=1,kind=ck_char) :: ???
!     
      integer,parameter :: ck_char       =  1
      integer,parameter :: ck_signed_char =  1
!     
!     logical(kind=ck_bool) ::
!     
      integer,parameter :: ck_bool       =  1
!     
!     integer(kind=ck_...) ::
!     
      integer,parameter :: ck_int        =  4
      integer,parameter :: ck_short      =  2
      integer,parameter :: ck_long       =  8
      integer,parameter :: ck_long_int   =  8
      integer,parameter :: ck_long_long  =  8
!     
!     real(kind=ck_...) ::
!     
      integer,parameter :: ck_float      =  4
      integer,parameter :: ck_double     =  8
      integer,parameter :: ck_long_double = 16
!     
!     complex(kind=ck_...) ::
!     
      integer,parameter :: ck_float_complex =  8
      integer,parameter :: ck_double_complex = 16
      integer,parameter :: ck_long_double_complex = 32
!     
!     Define constant mode_t for mkdir, mkfifo
!     Define constants for stat from <sys/stat.h>
!     
      integer,parameter :: ck_mode_t     =  4
      integer,parameter :: ck_time_t     =  8
      integer,parameter :: ck_clock_t    =  8
      integer,parameter :: ck_uid_t      =  4
      integer,parameter :: ck_gid_t      =  4
      integer,parameter :: ck_pid_t      =  4
      integer,parameter :: ck_size_t     =  8
      integer,parameter :: ck_ssize_t    =  8
      integer,parameter :: ck_dev_t      =  8
      integer,parameter :: ck_ino_t      =  8
      integer,parameter :: ck_off_t      =  8
      integer,parameter :: ck_nlink_t    =  8
      integer,parameter :: ck_blksize_t  =  8
      integer,parameter :: ck_blkcnt_t   =  8
      integer,parameter :: ck_fpos_t     = 16
      integer,parameter :: ck_null       =  0
      integer,parameter :: ck_intmax_t   =  8
!     
!     Define void* pointer in C language,
!     where intptr_t (=8) is from #include <stdint.h>
!     
      integer,parameter :: ck_intptr_t   =  8
      type ck_voidptr 
         integer(kind = ck_intptr_t) :: ptr 
      end type ck_voidptr 
      type(ck_voidptr),parameter :: ck_nullptr = ck_voidptr(0)
!     
!     Define stat from <stat/stat.h>, i.e. <bits/stat.h>
!     
      type ck_stat 
         integer(kind = ck_dev_t)      :: st_dev 
         integer(kind = ck_ino_t)      :: st_ino 
         integer(kind = ck_mode_t)     :: st_mode 
         integer(kind = ck_nlink_t)    :: st_nlink 
         integer(kind = ck_uid_t)      :: st_uid 
         integer(kind = ck_gid_t)      :: st_gid 
         integer(kind = ck_dev_t)      :: st_rdev 
         integer(kind = ck_off_t)      :: st_size 
         integer(kind = ck_time_t)     :: st_atime 
         integer(kind = ck_time_t)     :: st_mtime 
         integer(kind = ck_time_t)     :: st_ctime 
         integer(kind = ck_blksize_t)  :: st_blksize 
         integer(kind = ck_blkcnt_t)   :: st_blocks 
      end type ck_stat
!     
!     
      integer,parameter :: ck__sc_arg_max =  0
      integer,parameter :: ck__sc_child_max =  1
      integer,parameter :: ck__sc_host_name_max = 180
      integer,parameter :: ck__sc_login_name_max = 71
      integer,parameter :: ck__sc_clk_tck =  2
      integer,parameter :: ck__sc_open_max =  4
      integer,parameter :: ck__sc_pagesize = 30
      integer,parameter :: ck__sc_re_dup_max = 44
      integer,parameter :: ck__sc_stream_max =  5
      integer,parameter :: ck__sc_symloop_max = 173
      integer,parameter :: ck__sc_tty_name_max = 72
      integer,parameter :: ck__sc_tzname_max =  6
      integer,parameter :: ck__sc_version = 29
!     
!     Define the DIR * handler:
!     
      integer,parameter :: ck_dirptr     =  8
      type ck_dir 
         integer(kind = ck_dirptr) :: ptr 
      end type ck_dir 
!     
!     Define the FILE handler:
!     
      integer,parameter :: ck_fileptr    =  8
      type ck_file 
         integer(kind = ck_fileptr) :: ptr 
      end type ck_file 
      integer,parameter :: ck_eof        = -1
      integer,parameter :: ck_seek_set   =  0
      integer,parameter :: ck_seek_cur   =  1
      integer,parameter :: ck_seek_end   =  2
!     
!     Define constants for File
!     
      integer,parameter :: ck_f_ok       =  0
      integer,parameter :: ck_r_ok       =  4
      integer,parameter :: ck_w_ok       =  2
      integer,parameter :: ck_x_ok       =  1
      integer,parameter :: ck_s_irusr    = 256
      integer,parameter :: ck_s_iwusr    = 128
      integer,parameter :: ck_s_ixusr    = 64
      integer,parameter :: ck_s_irwxu    = 448
      integer,parameter :: ck_s_irgrp    = 32
      integer,parameter :: ck_s_iwgrp    = 16
      integer,parameter :: ck_s_ixgrp    =  8
      integer,parameter :: ck_s_irwxg    = 56
      integer,parameter :: ck_s_iroth    =  4
      integer,parameter :: ck_s_iwoth    =  2
      integer,parameter :: ck_s_ixoth    =  1
      integer,parameter :: ck_s_irwxo    =  7
      integer,parameter :: ck_s_isgid    = 1024
      integer,parameter :: ck_s_isuid    = 2048
!     
!     Define some constants in <linux/limits.h>
!     Note: <i_utils.h> re-defines the names
!         MAXLEN_PATHNAME := PATH_MAX
!         MAXLEN_FILENAME := NAME_MAX
!     
      integer,parameter :: ck_path_max   = 4096
      integer,parameter :: ck_name_max   = 255
!     
!     ASCII:
!     
      integer,parameter :: ck_icha_nul  =   0  ! NULL char
      integer,parameter :: ck_icha_soh  =   1  ! Start Of Heading
      integer,parameter :: ck_icha_stx  =   2  ! Start of TeXt
      integer,parameter :: ck_icha_etx  =   3  ! End   of TeXt
      integer,parameter :: ck_icha_eot  =   4  ! End Of Transmission
      integer,parameter :: ck_icha_enq  =   5  ! ENQuiry
      integer,parameter :: ck_icha_ack  =   6  ! Acknowledge
      integer,parameter :: ck_icha_bel  =   7  ! Alert, Bell
      integer,parameter :: ck_icha_bs   =   8  ! Back Space
      integer,parameter :: ck_icha_ff   =  12  ! New Page, Form Feed
      integer,parameter :: ck_icha_lf   =  10  ! New Line, Line Feed
      integer,parameter :: ck_icha_cr   =  13  ! Carriage Return
      integer,parameter :: ck_icha_tab  =   9  ! Horizontal Tab
      integer,parameter :: ck_icha_vt   =  11  ! Vertical Tab
      integer,parameter :: ck_icha_sub  =  26  ! Substitute
      integer,parameter :: ck_icha_esc  =  27  ! Escape
      integer,parameter :: ck_icha_fs   =  28  ! File Separator
      integer,parameter :: ck_icha_gs   =  29  ! Group Separator
      integer,parameter :: ck_icha_rs   =  30  ! Record Separator
      integer,parameter :: ck_icha_us   =  31  ! Unit Separator
!     
      character(len=1),parameter :: ck_char_nul  = achar(  0)  ! NULL char
      character(len=1),parameter :: ck_char_soh  = achar(  1)  ! Start Of Heading
      character(len=1),parameter :: ck_char_stx  = achar(  2)  ! Start of TeXt
      character(len=1),parameter :: ck_char_etx  = achar(  3)  ! End   of TeXt
      character(len=1),parameter :: ck_char_eot  = achar(  4)  ! End Of Transmission
      character(len=1),parameter :: ck_char_enq  = achar(  5)  ! ENQuiry
      character(len=1),parameter :: ck_char_ack  = achar(  6)  ! Acknowledge
      character(len=1),parameter :: ck_char_bel  = achar(  7)  ! Alert, Bell
      character(len=1),parameter :: ck_char_bs   = achar(  8)  ! Back Space
      character(len=1),parameter :: ck_char_ff   = achar( 12)  ! New Page, Form Feed
      character(len=1),parameter :: ck_char_lf   = achar( 10)  ! New Line, Line Feed
      character(len=1),parameter :: ck_char_cr   = achar( 13)  ! Carriage Return
      character(len=1),parameter :: ck_char_tab  = achar(  9)  ! Horizontal Tab
      character(len=1),parameter :: ck_char_vt   = achar( 11)  ! Vertical Tab
      character(len=1),parameter :: ck_char_sub  = achar( 26)  ! Substitute
      character(len=1),parameter :: ck_char_esc  = achar( 27)  ! Escape
      character(len=1),parameter :: ck_char_fs   = achar( 28)  ! File Separator
      character(len=1),parameter :: ck_char_gs   = achar( 29)  ! Group Separator
      character(len=1),parameter :: ck_char_rs   = achar( 30)  ! Record Separator
      character(len=1),parameter :: ck_char_us   = achar( 31)  ! Unit Separator
!     
!     Define some constants for Networking
!        #include <stdint.h>
!     
      integer,parameter :: ck_uint16_t   =  2
      integer,parameter :: ck_uint32_t   =  4
      integer,parameter :: ck_hostentptr =  8
!     
