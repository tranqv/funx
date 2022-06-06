      program t_fwrite_01 
!
      use my_funx 
      implicit none 
!
!     include     'i_param.inc'
!  
!     external    funx_seterrno, funx_geterrno, funx_perror,  &
!                 funx_fopen, funx_fclose, funx_fseek,        &
!                 funx_fread_astr, funx_fwrite_astr
!
      type(ck_file)        :: file 
!
!                                    5 x 1024^2 bytes = 5 Mb
      integer,parameter    :: mstr = 5 * 1024**2 
      character(len=mstr)  :: str 
!
      integer(kind=ck_size_t)    :: lm, lt 
      integer(kind=ck_int)       :: errno
      integer(kind=ck_long_int)  :: offset 
      integer(kind=ck_int)       :: whence 

      character(len=ck_path_max) fnam
      integer(kind=ck_size_t)    len_fnam, lentrim_fnam, m  
      integer     i 
!
!
      len_fnam = len(fnam)

      lentrim_fnam = -1 
      call funx_getarg ( 1, fnam, lentrim_fnam, errno )

      if ( lentrim_fnam .lt. 0 ) then
         print *, "ERROR: Wrong input. Usage: "
         print *, "  ./a.out  somefile "
         print *, "  ./a.out  somefile > 2>/dev/null "
         stop 
      else
         print '(a,/,72("-"))', "Writing File: "//fnam(1:lentrim_fnam) 
      endif 

      call  funx_fopen ( file, fnam(1:lentrim_fnam), "w", errno ) 
      if ( errno .ne. 0 ) goto 700 

      offset = 0
      whence = ck_seek_set

      call  funx_fseek ( file, offset, whence, errno )
      if ( errno .ne. 0 ) goto 701  

      str = '' 

      do i = 1, 100
         str = trim(str) // 'Tran Quoc Viet at home' // ck_char_lf 
      enddo

      lm = len(str)
      lt = len_trim(str)

      call  funx_fwrite_astr ( file, str(1:lt), lt, m, errno ) 
      if ( errno .ne. 0 ) goto 702  

      write(*,1) lm, lt, m, errno



 500  call  funx_fclose ( file, errno )
      call  funx_perror ( 'funx_fclose', errno )
      stop 
!-----
1     format ( 'lm, lt=', i15, i15 ', m = ', i5, ', errno =', i5  )

!------
!
!     Error handling: 
!
 700  call  funx_perror ( 'funx_fopen', errno )
      stop 
 701  call  funx_perror ( 'funx_fseek', errno )
      goto 500 
 702  call  funx_perror ( 't_fwrite_01.f90', errno )
      goto 500

      end program 
!
!
!
!
!
!
