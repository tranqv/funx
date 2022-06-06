!
!     Read stream coming out from the 'ls *' command line.
!
      program t_popen_02 
!
      use my_funx
      implicit none 
!
!     external    funx_seterrno, funx_geterrno, funx_perror,  &
!                 funx_popen, funx_pclose
!
      type(ck_file)              :: file_i
!
      integer,parameter          :: lbuff = 1024
      character(len=lbuff)       :: str, strout, cmd 
      integer(kind=ck_size_t)    :: lm, lt 
!
      integer(kind=ck_int)       istat, ic, errno  
      character(len=ck_path_max) path
      integer(kind=ck_size_t)    lentrim_path
!
!
!
      lentrim_path = -1 
      call funx_getarg ( 1, path, lentrim_path, errno )

      if ( lentrim_path .le. 0 ) then
         cmd = "ls -la ./*"
      else 
         if ( path(lentrim_path:lentrim_path) .eq. '/' ) then 
            path(lentrim_path:) = '' 
         endif 
         cmd = "ls -la "//trim(path)//"/*"
      endif 

      strout = "Execute "//trim(cmd)//" ..."//ck_char_lf//ck_char_lf  

      call funx_fputs_stdout ( trim(strout), istat )
!
!
      call funx_popen ( file_i, trim(cmd), "r", istat ) 

      if ( istat .ne. 0 ) goto 700 


      lm = len(str)
      lt = 0 
      ic = 0 

 500  continue 

      call funx_fgets ( file_i, str, lm, lt )

      if ( lt .gt. 0 ) then
!
!        Dont count the string with only on character, .i.e. the newline.
!
         if ( lt .gt. 1 ) ic = ic + 1  

         strout = '' 
         write ( strout, &
            fmt='("ID =",i7,2x,"LEN =",i3,2x,"STR: ",a)' ) &
            ic, lt, str(1:lt)

         call funx_fputs_stdout ( trim(strout), istat ) 

         if ( istat .ne. 0 ) goto 500 

      endif 
!
!     Just try but I dont really know they are for what?
!     Whithout them, every thing is also fine.
!
!     call funx_fflush ( file_i, istat )
!     if ( istat .ne. 0 ) goto 800 
!     call funx_fflush_stdout ( istat )
!     if ( istat .ne. 0 ) goto 801 
      call funx_fflush_all    ( istat  )  
!     if ( istat .ne. 0 ) goto 802 
!
!
!
      call funx_pclose ( file_i, istat ) 

      if ( istat .lt. 0 ) then
         write(*,*) "ERROR: pclose."
      else 
         write(*,*) "OK. pclose, stat =", istat 
      endif 

      stop 
!-----
 700  continue

      write(*,*) "ERROR: popen, ", istat
 
      stop 

      end program 
!
!
!
!
!
!
