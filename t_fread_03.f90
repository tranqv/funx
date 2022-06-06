!
!
!     This is my own 'cat' command. 
!
!     It's very very fast, even faster than the standard 'cat' 
!     command of Linux.
!
!
      program t_fread_03 
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
!     character(len=128)   :: str 
      character(len=4096)  :: str 
      integer(kind=ck_size_t) :: lm, lt 
      integer(kind=ck_int) :: errno
      integer(kind=ck_long_int) :: offset 
      integer(kind=ck_int)      :: whence 

      character(len=ck_path_max) fnam
      integer(kind=ck_size_t)    len_fnam, lentrim_fnam  
      integer(kind=ck_int)       icount 
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
         print '(a,/,72("-"))', "READING File: "//fnam(1:lentrim_fnam) 
      endif 

      call  funx_fopen ( file, fnam(1:lentrim_fnam), "r", errno ) 
      if ( errno .ne. 0 ) goto 700 

      icount = 0 
      whence = ck_seek_set
      offset = 0

      lm = len(str)

 100  continue 

         call  funx_fseek ( file, offset, whence, errno )
         if ( errno .ne. 0 ) goto 701 

         lt = 0 

!        call  funx_fread_astr ( file, str, lm, lt, errno )
         call  funx_fread_astr ( file, str, lm, lt, errno )

         if ( errno .ne. 0 ) goto 702 

         write(*,'(a)',advance='no') str(1:lt) 

         if ( lt .eq. lm ) then
            icount = icount + 1 
            offset = offset + lm 
            goto 100 
         endif 

!200  continue

      write(*,'(72("-"),/,"END READING.",/)')

500   call  funx_fclose ( file, errno )
      call  funx_perror ( 'funx_fclose', errno )
      stop 

700   call  funx_perror ( 'funx_fopen', errno )
      stop 

701   call  funx_perror ( 'funx_fseek', errno )
      goto 500

702   call  funx_perror ( 't_fread_03.f90', errno )
      goto 500 


! 1   format ( /, '>>> astr:', /, a, /, 72('^'), //, &
!             'lm = ', i5, /, 'lt = ', i5, /, 'errno =', i3  )

! 2   format ( 60('+'),' lm = ',i5, ', lt = ',i5, ', errno =',i3, /, &
!              a  )


      end program 
!
!
!
!
!
!
