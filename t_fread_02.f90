      program t_fread_02 
!
      use my_funx 
      implicit none 
!
!     include     'i_param.inc'
!  
!     external    funx_seterrno, funx_geterrno, funx_perror,  &
!                 funx_fopen, funx_fclose, funx_fseek,        &
!                 funx_fread_astr
!
      type(ck_file)        :: file 
      integer,parameter    :: mstr = 1024**2 * 5 != 5 x 1024^2 bytes = 5 Mb
      character(len=mstr)  :: str 
      integer(kind=ck_size_t) :: lm, lt 
      integer(kind=ck_int) :: errno
      integer(kind=ck_long_int) :: offset 
      integer(kind=ck_int)      :: whence 

      character(len=ck_path_max) fnam
      integer(kind=ck_size_t)    len_fnam, lentrim_fnam  
!

      len_fnam = len(fnam)

      lentrim_fnam = -1 
      call funx_getarg ( 1, fnam, lentrim_fnam, errno )

      if ( lentrim_fnam .lt. 0 ) then
         print *, "ERROR: Wrong input. Usage: "
         print *, "  ./a.out  somefile "
         print *, "  ./a.out  somefile | nl "
         print *, "  ./a.out  somefile > 2>/dev/null | nl "
         stop 
      else
         print '(72("v"),/,a)', "Catting File: "//fnam(1:lentrim_fnam) 
      endif 

      call  funx_fopen ( file, fnam(1:lentrim_fnam), "r", errno ) 

      call  funx_perror  ( 'funx_fopen', errno )

      if ( errno .ne. 0 ) stop 

      offset = 0
!     offset = 1
      whence = ck_seek_set

      call  funx_fseek ( file, offset, whence, errno )

      call  funx_perror  ( 'funx_fseek', errno )

      if ( errno .ne. 0 ) stop 

!     str = ''

      lm = len(str)
      lt = 0 

      call  funx_fread_astr ( file, str, lm, lt, errno ) 

      call  funx_perror  ( 't_fread_02.f90', errno )

      if ( errno .eq. 0 ) then 
         write(*,1) str(1:lt), lm, lt, errno
      endif 

      call  funx_fclose ( file, errno )

      stop 

1     format ( /, '>>> astr:', /, a, /, 72('^'), //, &
               'lm = ', i15, /, 'lt = ', i15, /, 'errno =', i5  )

      end program 
!
!
!
!
!
!
