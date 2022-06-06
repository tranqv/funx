!
!     WORKS!
!
!     New version: 
!        Pass arguments using its reference with value in integer(8), i.e.  
!        intptr_t defined in /usr/include/stdint.h
!
!
      program t_fcat02 
!
      use mod_funx_param 
      use mod_funx_faces 
      implicit none 
!
!     include     'i_param.inc'
!     include     'i_errno.inc'
!  
      external    f_fopen, f_fclose, f_fseek, &
                  f_fread_astr, f_fwrite_astr
!
!     Reference of files:
!
      integer(kind=ck_intptr_t)  :: ifi, ifo 
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
      integer(kind=ck_int)       icount, istat  
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
            "  ./a.out  /path/x.zip  y.zip" // ck_char_lf // &
            "  ./a.out  SRC DES > 2>/dev/null" // ck_char_lf 
         errno = ck_einval
         call funx_seterrno ( errno ) 
         call funx_perror ( trim(strout), errno )
         stop 
      endif 

      call  f_fopen ( ifi, fnam_i(1:lentrim_fnam_i), "r" )
      if ( ifi .eq. 0 ) goto 700 


      if ( lentrim_fnam_o .le. 0 ) then
         call  f_fstdout ( ifo ) 

         print '( a,/, 6x,a,/, a,/, 72("-"))', &
            "STREAMING FROM", fnam_i(1:lentrim_fnam_i), "TO STDOUT" 
      else 

         call  f_fopen ( &
               ifo, fnam_o(1:lentrim_fnam_o), "w" ) 
         if ( ifo .eq. 0 ) goto 800 

         print '( a,/, 6x,a,/, a,/, 6x,a,/,  72("-"))', &
            "STREAMING FROM", fnam_i(1:lentrim_fnam_i), "TO", &
                              fnam_o(1:lentrim_fnam_o) 
      endif 


      icount = 0 
      whence = ck_seek_set
      offset = 0

      lm = len(str)

 100  continue 

         call  f_fseek ( ifi, offset, whence, istat )
         if ( istat .ne. 0 ) goto 701 

         if ( lentrim_fnam_o .gt. 0 ) then
            call  f_fseek ( ifo, offset, whence, istat )
            if ( istat .ne. 0 ) goto 801 
         endif 

         lt = 0 

         call  f_fread_astr ( ifi, str, lm, lt ) 
!        if ( lt .eq. 0 ) goto 702 

         call  f_fwrite_astr ( ifo, str(1:lt), lt, m ) 
!        if ( errno .ne. 0 ) goto 802 
!
!!       Check if it can write acsii characters:
!!       write(1,*) str(1:lt)
!
         if ( lt .eq. lm ) then
            icount = icount + 1 
            offset = offset + lm 
            goto 100 
         endif 

!200  continue

      write(*,'(72("-"),/,"END.",/)')

 500  call  f_fclose ( ifi, istat )

      if ( lentrim_fnam_o .gt. 0 ) then
         call  f_fclose ( ifo, errno )
      endif 
      stop 

 700  call  funx_perror ( 'f_fopen: src', errno )
      stop 
 800  call  funx_perror ( 'f_fopen: des', errno )
      stop 
!810  call  funx_perror ( 'f_fopen: STDOUT', errno )
      stop 

 701  call  funx_perror ( 'f_fseek: src', errno )
      goto 500
 801  call  funx_perror ( 'f_fseek: des', errno )
      goto 500

!702  call  funx_perror ( 'f_fread_astr', errno )
      goto 500 
!802  call  funx_perror ( 'f_fwrite_astr', errno )
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
