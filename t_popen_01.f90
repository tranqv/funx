!
!     Read stream coming out from the 'ls *' command line.
!
      program t_popen_01 
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
      character(len=lbuff)       :: str 
      integer(kind=ck_size_t)    :: lm, lt 
      integer(kind=ck_int)       istat, ic
!
!
      call  funx_popen ( file_i, "ls *", "r", istat ) 

      if ( istat .ne. 0 ) goto 700 


      lm = len(str)
      lt = 0 
      ic = 0 

 500  continue 

      call funx_fgets ( file_i, str, lm, lt )

      if ( lt .gt. 0 ) then
         ic = ic + 1  

         write(*,fmt='(i7,3x,a)',advance="no") ic, str(1:lt)

         goto 500

      endif 

      call funx_pclose ( file_i, istat ) 

      if ( istat .lt. 0 ) then
         write(*,*) "ERROR: pclose."
      else 
         write(*,*) "OK. pclose,", istat 
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
