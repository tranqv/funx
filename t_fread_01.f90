      program t_fread_01 
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
      character(len=4096)  :: str, strout 
      integer(kind=ck_size_t) :: lm, lt, lx 
      integer(kind=ck_int) :: errno, istat 
      integer(kind=ck_long_int) :: offset 
      integer(kind=ck_int)      :: whence
      character(len=*),parameter :: fname= "x_fread_01.txt"
!
!
      strout = 'Opening '//fname//ck_char_lf
      lx  = len_trim(str)
      call  funx_fputs_stdout( strout, lx, istat )

      call  funx_fopen ( file, fname, "r", errno ) 
      call  funx_perror  ( 'funx_fopen', errno )

      if ( errno .ne. 0 ) stop 

      offset = 0 
      whence = ck_seek_set

      call  funx_fseek ( file, offset, whence, errno )

      call  funx_perror  ( 'funx_fseek', errno )

      if ( errno .ne. 0 ) stop 

!     str = ''

      lm = len(str)
      lt = 0 

      strout = 'Reading '//fname//ck_char_lf
      lx = len_trim(strout)
      call  funx_fputs_stdout( strout, lx, istat )

      call  funx_fread_astr ( file, str, lm, lt, errno ) 

      call  funx_perror  ( 't_fread_01.f90', errno )

      if ( errno .eq. 0 ) then 
         write(*,1) str(1:lt), lm, lt, errno
      endif 

      stop 

1     format ( /, '>>> astr:', /, a, //, 'lm = ', i15, /, &
               'lt = ', i15, /, 'errno =', i5  )

      end program 
!
!
!
!
!
!
