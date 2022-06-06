!
!
!     t_fread_04 is NOT so fast as t_fread_03 
!
!
      program t_fread_04 
!
      use my_funx 
      implicit none 
!
      type(ck_file)        :: file
      integer,parameter    :: lstr = 8096 
      character            :: str(lstr)
      character(len=lstr)  :: buf
      integer(kind=ck_size_t) :: lm, lt, i 
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

      lm = size(str)

 100  continue 

         call  funx_fseek ( file, offset, whence, errno )
         if ( errno .ne. 0 ) goto 701 

         lt = 0 

!        call  funx_fread_astr ( file, str, lm, lt, errno ) 
         call  funx_fread_astr ( file, str, lm, lt, errno ) 

         if ( errno .ne. 0 ) goto 702 
!
!  Slow, very slow
!        do  i = 1, lt 
!           write(*,fmt='(a1)',advance='no') str(i)
!        enddo
!
!  Faster much:
         do  i = 1, lt 
            buf(i:i) = str(i)
         enddo
         write(*,'(a)',advance='no') buf(1:lt) 
!
!
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

702   call  funx_perror ( 't_fread_04.f90', errno )
      goto 500 

      end program 
!
!
!
!
!
!
