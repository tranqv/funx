!
!     SLOW!
!
!     Like t_fcopy_02, but use 
!        fgetc
!     instead of 
!        fread 
!
!     It work correcly with Zip file (binary).  BUT it's very slow.
!
      program t_fcopy_05 
!
      use my_funx
      implicit none 
!
!     include     'i_param.inc'
!     include     'i_errno.inc'
!  
!     external    funx_seterrno, funx_geterrno, funx_perror,  &
!                 funx_fopen, funx_fclose, funx_fseek,        &
!                 funx_fread_astr, funx_fwrite_astr, &
!                 funx_fgetc, funx_fputs_stderr
!
      type(ck_file)              :: file_i, file_o  
!
!                                           10   KB Buffer
      integer,parameter          :: lbuff = 10 * 1024
      character(len=lbuff)       :: str 
      character(len=1024)        :: strout
      integer(kind=ck_size_t)    :: lm, lt, m 
      integer(kind=ck_int)       :: errno
      integer(kind=ck_long_int)  :: offset 
      integer(kind=ck_int)       :: whence 

      character(len=ck_path_max) fnam_i, fnam_o
      integer(kind=ck_size_t)    &
         len_fnam_i, lentrim_fnam_i, len_fnam_o, lentrim_fnam_o  
      integer(kind=ck_int)       icount, c, istat  
      integer(kind=ck_size_t)    i
!
!
      len_fnam_i = len(fnam_i)
      len_fnam_o = len(fnam_o)

      lentrim_fnam_i = -1 
      call funx_getarg ( 1, fnam_i, lentrim_fnam_i, errno )

      lentrim_fnam_o = -1 
      call funx_getarg ( 2, fnam_o, lentrim_fnam_o, errno )

      if ( lentrim_fnam_i .le. 0 ) then
         strout = &
            "ERROR: Wrong input." // ck_char_lf // &
            "Usage: streaming SRC file to DES, where" // ck_char_lf // &
            "       DES is a regular file or STDOUT." // ck_char_lf // &
            "  ./a.out  SRC " // ck_char_lf // &
            "  ./a.out  SRC 2>/dev/null" // ck_char_lf // &
            "  ./a.out  SRC DES " // ck_char_lf // &
            "  ./a.out  SRC DES > 2>/dev/null" // ck_char_lf 
!        errno = ck_einval
!        call funx_seterrno ( errno ) 
!        call funx_perror ( trim(strout), errno )

         lt = len_trim(strout)
         call funx_fputs_stderr ( trim(strout), lt, istat )
         stop 
      endif 

      call  funx_fopen ( file_i, fnam_i(1:lentrim_fnam_i), "r", errno ) 
      if ( errno .ne. 0 ) goto 700 


      if ( lentrim_fnam_o .le. 0 ) then
         call  funx_fstdout ( file_o ) 
         if ( errno .ne. 0 ) goto 810 

         print '( a,/, 6x,a,/, a,/, 72("-"))', &
            "STREAMING FROM", fnam_i(1:lentrim_fnam_i), "TO STDOUT" 
      else 

         call  funx_fopen ( &
               file_o, fnam_o(1:lentrim_fnam_o), "w", errno ) 
         if ( errno .ne. 0 ) goto 800 

         print '( a,/, 6x,a,/, a,/, 6x,a,/,  72("-"))', &
            "STREAMING FROM", fnam_i(1:lentrim_fnam_i), "TO", &
                              fnam_o(1:lentrim_fnam_o) 
      endif 


      icount = 0 
      whence = ck_seek_set
      offset = 0

      lm = len(str)

 100  continue 

         call  funx_fseek ( file_i, offset, whence, errno )
         if ( errno .ne. 0 ) goto 701 

         if ( lentrim_fnam_o .gt. 0 ) then
            call  funx_fseek ( file_o, offset, whence, errno )
            if ( errno .ne. 0 ) goto 801 
         endif 
!
!
!        lt = 0 
!
!        call  funx_fread_astr ( file_i, str, lm, lt, errno ) 
!        if ( errno .ne. 0 ) goto 702 

         lt = 0 
         do i = 1, lm 
            call funx_fgetc ( file_i, c )
            if ( c .ne. ck_eof ) then  
               str(i:i) = char(c)
               lt = lt + 1 
            else 
               exit 
            endif 
         enddo
!
!
         call  funx_fwrite_astr ( file_o, str(1:lt), lt, m, errno ) 
         if ( errno .ne. 0 ) goto 802 


         if ( lt .eq. lm ) then
            icount = icount + 1 
            offset = offset + lm 
            goto 100 
         endif 

!200  continue

      write(*,'(72("-"),/,"END.",/)')

 500  call  funx_fclose ( file_i, errno )
      call  funx_perror ( 'funx_fclose: src', errno )
      if ( lentrim_fnam_o .gt. 0 ) then
         call  funx_fclose ( file_o, errno )
         call  funx_perror ( 'funx_fclose: des', errno )
      endif 
      stop 

 700  call  funx_perror ( 'funx_fopen: src', errno )
      stop 
 800  call  funx_perror ( 'funx_fopen: des', errno )
      stop 
 810  call  funx_perror ( 'funx_fopen: STDOUT', errno )
      stop 

 701  call  funx_perror ( 'funx_fseek: src', errno )
      goto 500
 801  call  funx_perror ( 'funx_fseek: des', errno )
      goto 500

!702  call  funx_perror ( 'funx_fread_astr', errno )
!     goto 500 
 802  call  funx_perror ( 'funx_fwrite_astr', errno )
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
