!
!     FASTest! arrange in speed:  01 > 02 > 03 > 05 > 04 >> 06 
!
!     This is my own 'cat' command. (New version: t_fcopy_02)
!
!     It's very very fast, even faster than the standard 'cat' 
!     command of Linux.
!
!
      program t_fcopy_01 
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
      type(ck_file)              :: file_i, file_o  
!
!     testing with a large buffer size --> larger buffer, it runs faster!
!       
      integer,parameter          :: lbuff =   1 * 1024 * 1024  !   1 MB
!     integer,parameter          :: lbuff = 100 * 1024 * 1024  ! 100 MB
      character(len=lbuff)       :: str 
      integer(kind=ck_size_t)    :: lm, lt, m 
      integer(kind=ck_int)       :: errno
      integer(kind=ck_long_int)  :: offset 
      integer(kind=ck_int)       :: whence 

      character(len=ck_path_max) fnam_i, fnam_o
      integer(kind=ck_size_t)    &
         len_fnam_i, lentrim_fnam_i, len_fnam_o, lentrim_fnam_o  
      integer(kind=ck_int)       icount 
!

      len_fnam_i = len(fnam_i)
      len_fnam_o = len(fnam_o)

      lentrim_fnam_i = -1 
      call funx_getarg ( 1, fnam_i, lentrim_fnam_i, errno )

      lentrim_fnam_o = -1 
      call funx_getarg ( 2, fnam_o, lentrim_fnam_o, errno )


      if ( lentrim_fnam_o .lt. 0 ) then
                print *, "ERROR: Wrong input."
         print *, "Usage: streaming SRC file to DES file,"
         print *, "  ./a.out  SRC DES "
         print *, "  ./a.out  SRC DES > 2>/dev/null"
         stop 
      else
         print '( a,/, 6x,a,/, a,/, 6x,a,/,  72("-"))', &
            "STREAMING FROM", fnam_i(1:lentrim_fnam_i), "TO", &
                               fnam_o(1:lentrim_fnam_o) 
      endif 

      call  funx_fopen ( file_i, fnam_i(1:lentrim_fnam_i), "r", errno ) 
      if ( errno .ne. 0 ) goto 700 

      call  funx_fopen ( file_o, fnam_o(1:lentrim_fnam_o), "w", errno ) 
      if ( errno .ne. 0 ) goto 800 

      icount = 0 
      whence = ck_seek_set
      offset = 0

      lm = len(str)

 100  continue 

         call  funx_fseek ( file_i, offset, whence, errno )
         if ( errno .ne. 0 ) goto 701 

         call  funx_fseek ( file_o, offset, whence, errno )
         if ( errno .ne. 0 ) goto 801 

         lt = 0 

         call  funx_fread_astr ( file_i, str, lm, lt, errno ) 
         if ( errno .ne. 0 ) goto 702 

         call  funx_fwrite_astr ( file_o, str(1:lt), lt, m, errno ) 
         if ( errno .ne. 0 ) goto 802 


         if ( lt .eq. lm ) then
            icount = icount + 1 
            offset = offset + lm 
            goto 100 
         endif 

!200  continue

      write(*,'(72("-"),/,"END.",/)')

500   call  funx_fclose ( file_i, errno )
      call  funx_perror ( 'funx_fclose: src', errno )
      call  funx_fclose ( file_o, errno )
      call  funx_perror ( 'funx_fclose: des', errno )
      stop 

700   call  funx_perror ( 'funx_fopen: src', errno )
      stop 
800   call  funx_perror ( 'funx_fopen: des', errno )
      stop 

701   call  funx_perror ( 'funx_fseek: src', errno )
      goto 500
801   call  funx_perror ( 'funx_fseek: des', errno )
      goto 500

702   call  funx_perror ( 'funx_fread_astr', errno )
      goto 500 
802   call  funx_perror ( 'funx_fwrite_astr', errno )
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
