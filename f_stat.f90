!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_stat ( path, fstat )
!
      use mod_funx_param, only: ck_stat, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)      :: path
      type(ck_stat),intent(out)        :: fstat
!
      external    c_stat 
!
!
      call c_stat (                &
            path // ck_char_nul,   &
            fstat % st_dev,        &
            fstat % st_ino,        &
            fstat % st_mode,       &
            fstat % st_nlink,      &
            fstat % st_uid,        &
            fstat % st_gid,        &
            fstat % st_rdev,       &
            fstat % st_size,       &
            fstat % st_atime,      &
            fstat % st_mtime,      &
            fstat % st_ctime,      &
            fstat % st_blksize,    &
            fstat % st_blocks      )

      return 
      end subroutine f_stat
!
!-----------------------------------------------------------------------
!
      subroutine  f_stat_print ( fstat ) 
!
      use mod_funx_param, only: ck_stat, ck_mode_t, ck_off_t, &
                                ck_float, ck_size_t, ck_int 
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_stat),intent(in) :: fstat
!
      character(len=20)          perm, fupm 
      integer(kind=ck_mode_t)    idec, ioct 
      integer(kind=ck_off_t)     isize
      real(kind=ck_float)        rsize
      character(len=20)          unitstr
      character(len=50)          catim, cmtim, cctim
      integer(kind=ck_size_t)    lma, lta, lmm, ltm, lmc, ltc 
!
      external    f_utils_dec2oct, f_utils_dec2per, f_utils_dec2fup, & 
                  f_utils_scalebyte, f_strftime
!
!
      idec = fstat % st_mode
      call f_utils_dec2oct ( idec, ioct )
      call f_utils_dec2per ( idec, perm )
      call f_utils_dec2fup ( idec, fupm )
!
      isize = fstat % st_size
      call f_utils_scalebyte ( isize, rsize, unitstr )
!
!     print *, "OK"
!
      lma = len(catim)
      lmm = len(cmtim)
      lmc = len(cctim)  
!
      call f_strftime ( &
           fstat % st_atime, catim, lma, lta )
      call f_strftime ( &
           fstat % st_mtime, cmtim, lmm, ltm )
      call f_strftime ( &
           fstat % st_ctime, cctim, lmc, ltc )
!
!     print *, "OK"
!
      write(*,1)                &
         fstat % st_dev,        &      
         fstat % st_ino,        &      
         fstat % st_mode, '(decf)',ioct,'(octf)',trim(perm),'(perm)', &
         fstat % st_nlink,      &
         fstat % st_uid,        &
         fstat % st_gid,        &
         fstat % st_rdev,       &
         fstat % st_size, '(bytes)', rsize, trim(unitstr),  &
         fstat % st_atime, catim(1:lta),   &
         fstat % st_mtime, cmtim(1:ltm),   &
         fstat % st_ctime, cctim(1:ltc),   &
         fstat % st_blksize,    &
         fstat % st_blocks      
!
      write(*,2) trim(fupm) 
!
!
 1    format (                    &
         " 1. dev     =", 1x, I15, /, &
         " 2. ino     =", 1x, I15, /, &
         " 3. mode    =", 1x, I15, a7, 2x, I15, a7, 2x, a10, a7, /, &
         " 4. nlink   =", 1x, I15, /, &
         " 5. uid     =", 1x, I15, /, &
         " 6. gid     =", 1x, I15, /, &
         " 7. rdev    =", 1x, I15, /, &
         " 8. size    =", 1x, I15, a8,' = ',f10.3,' (',a2,')', /, &
         " 9. atime   =", 1x, I15, a30, /, &
         "10. mtime   =", 1x, I15, a30, /, &
         "11. ctime   =", 1x, I15, a30, /, & 
         "12. blksize =", 1x, I15, /, &
         "13. blocks  =", 1x, I15, /  )
!
 2    format ('--> Fully Unix permission based on mode: ', a, / )
!
      return 
      end subroutine f_stat_print 
!
!-----------------------------------------------------------------------
!
