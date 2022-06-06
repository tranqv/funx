!
!     Read stream coming out from the 'ls *' command line.
!
      program t_popen_03 
!
      use my_funx
      implicit none 
!
!     external    funx_seterrno, funx_geterrno, funx_perror,  &
!                 funx_popen, funx_pclose
!
      type(ck_file)              :: file_i, file_o
!
      integer,parameter          :: lbuff = 1024
      character(len=lbuff)       :: str, strout, cmd1, cmd2  
      integer(kind=ck_size_t)    :: lm, lt 
!
      integer(kind=ck_int)       istat, ic, errno  
      character(len=ck_path_max) path
      integer(kind=ck_size_t)    lentrim_path
      logical  ::  deobietxai = .false.
!
!
!     arg1:
!
      lentrim_path = -1 
      call funx_getarg ( 1, path, lentrim_path, errno )

      if ( lentrim_path .le. 0 ) then
         cmd1 = "ls -la ./"
         deobietxai = .true.
      else 
!        if ( path(lentrim_path:lentrim_path) .eq. '/' ) then 
!           cmd1 = "ls -la "//trim(path)//"*"
!        else 
!           cmd1 = "ls -la "//trim(path)//"*"
!        endif 
         cmd1 = "ls -la "//trim(path)
      endif 
!
!     arg2:
!
      path = ''
      lentrim_path = -1 
      call funx_getarg ( 2, path, lentrim_path, errno )

      if ( lentrim_path .le. 0 ) then
         cmd2 = ""
         strout = &
            "Execute "// trim(cmd1) // " | <BlackBox> "// &
             " ..."//ck_char_lf//ck_char_lf  
      else 
!        if ( path(lentrim_path:lentrim_path) .eq. '/' ) then 
!           path(lentrim_path:) = '' 
!        endif 
         cmd2 = "grep --color "//trim(path)
         strout = &
            "Execute "// trim(cmd1) //" | <BlackBox> | "//trim(cmd2)// &
            " ..."//ck_char_lf//ck_char_lf  
      endif 

      call funx_fputs_stdout ( trim(strout)//ck_char_lf, istat )
!
!
      call funx_popen ( file_i, trim(cmd1), "r", istat ) 

      if ( istat .ne. 0 ) goto 700 

      if ( len_trim(cmd2) .gt. 0 ) then 
         call funx_popen ( file_o, trim(cmd2), "w", istat ) 
         if ( istat .ne. 0 ) goto 701 
      endif 


      lm = len(str)
      lt = 0 
      ic = 0 

 500  continue 

!     call funx_fgets ( file_i, str, lm, lt )
      call funx_fgets ( file_i, str, lm, lt )   ! equiv

      if ( lt .gt. 0 ) then
!
!        Dont count the string with only on character, .i.e. the newline.
!
         if ( lt .gt. 1 ) then
            ic = ic + 1  

            strout = '' 
!           write ( strout, &
!              fmt='("ID =",i7,2x,"LEN =",i3,2x,"STR: ",a)' ) &
!              ic, lt, str(1:lt)
            write ( strout, &
               fmt='("LEN =",i3,2x,"<<< ",a)' ) &
!              lt-1, str(1:lt)                     ! with the newline char
               lt-1, str(1:lt-1)                   ! without the NL 


            if ( len_trim(cmd2) .gt. 0 ) then 
               call funx_fputs ( &
                    file_o, trim(strout)//ck_char_lf, istat ) 
            else 
               call funx_fputs_stdout ( &
                    trim(strout)//ck_char_lf, istat ) 
            endif 

            if ( istat .ne. 0 ) goto 500 
         endif 

      endif 
!
!     Just try but I dont really know they are for what?
!     Whithout them, every thing is also fine.
!
!     call funx_fflush ( file_i, istat )
!     if ( istat .ne. 0 ) goto 800 
!     call funx_fflush_stdout ( istat )
!     if ( istat .ne. 0 ) goto 801 
!     call funx_fflush_all    ( istat  )  
!     if ( istat .ne. 0 ) goto 802 
!
!
!
      call funx_pclose ( file_i, istat )
      strout = '' 
      if ( istat .lt. 0 ) then
         write ( strout, &
            fmt='("ERROR: pclose file_i, stat = ",i9)' ) istat
      else 
         write ( strout, &
            fmt='("OK. pclose file_i, stat = ",i9)' ) istat
      endif 
      call funx_fputs_stderr ( trim(strout)//ck_char_lf, istat )
!
      if ( len_trim(cmd2) .gt. 0 ) then 
         call funx_pclose ( file_o, istat )
         strout = '' 
         if ( istat .lt. 0 ) then
            write ( strout, &
               fmt='("ERROR: pclose file_o, stat = ",i9)' ) istat
         else 
            write ( strout, &
               fmt='("OK. pclose file_o, stat = ",i9)' ) istat
         endif 
         call funx_fputs_stderr ( trim(strout)//ck_char_lf, istat )
      endif 
!
      goto 600 
!-----
 700  continue
      strout = '' 
      write ( strout, &
         fmt='("ERROR: popen pipe to CMD1, stat = ",i9)' ) istat
      call funx_fputs_stderr ( trim(strout)//ck_char_lf, istat )
      goto 600  
!
 701  continue
      strout = '' 
      write ( strout, &
         fmt='("ERROR: popen pipe to CMD2, stat = ",i9)' ) istat
      call funx_fputs_stderr ( trim(strout)//ck_char_lf, istat )
      goto 600  
!
 600  if ( deobietxai ) call print_usage 
      stop 
!-----
!
      contains 
!-----
      subroutine print_usage 

      strout = &
            "USAGE:" // ck_char_lf // ck_char_tab //                  &
            "./a.out                   "// ck_char_lf //ck_char_tab// &
            "./a.out .                 "// ck_char_lf //ck_char_tab// &
            "./a.out ./                "// ck_char_lf //ck_char_tab// &
            "./a.out ..                "// ck_char_lf //ck_char_tab// &
            "./a.out ../               "// ck_char_lf //ck_char_tab// &
            "./a.out ~                 "// ck_char_lf //ck_char_tab// &
            "./a.out ~/                "// ck_char_lf //ck_char_tab// &
            "./a.out /some/path        "// ck_char_lf //ck_char_tab// &
            "./a.out /some/path/       "// ck_char_lf //ck_char_tab// &
            "./a.out /some/path/  viet "// ck_char_lf
 
      call funx_fputs_stderr ( trim(strout)//ck_char_lf, istat )

      end subroutine 
!
      end program 
!
!
!
!
!
!
