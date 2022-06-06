

      program t_makeindex_01
!
      use my_funx
      implicit none 
!
      character(len=ck_name_max)    fname
      integer(kind=ck_int)          errno
      integer(kind=ck_size_t)       len_fname, lentrim_fname
      integer(kind=ck_intptr_t)     iptr 
      integer                       id 
      character(len=99)             arg1
      integer(kind=ck_size_t)       len_arg1, lentrim_arg1
!
!
      errno = 0
      call funx_seterrno ( errno )
!
      len_arg1 = len(arg1)

      lentrim_arg1 = -1 
      call funx_getarg ( 1, arg1, lentrim_arg1, errno )
   
      if ( lentrim_arg1 .lt. 0 ) then 
         write(*,*) "./a.out  your_folder_name"
         stop 
      end if 

      write(*,'( a, a, i4 /, 72("-"), / )') &
         "list "//arg1(1:lentrim_arg1), ', len =', lentrim_arg1

      iptr = 0
      call funx_opendir ( arg1(1:lentrim_arg1), iptr, errno )

      if ( iptr .eq. 0 ) goto 600

      call funx_rewinddir ( iptr, errno )

      len_fname = len(fname)

      id = 0 
      do 
         id = id + 1 

         call funx_readdir ( &
              iptr, fname, len_fname, lentrim_fname, errno )

         if ( lentrim_fname < 0 ) then
            write(*,*) 'reaching the end of folder ?'
            exit  
         endif 

         if ( funx_is_dir(fname(1:lentrim_fname)) ) then 
            write(*,1) id, fname(1:lentrim_fname), 'Directory'
         else 
            write(*,1) id, fname(1:lentrim_fname), 'File'
         endif 

      enddo

      write(*,*) 'At the end of reading DIR. errno = ', errno 
      write(*,*) 'where the dir handler pointer dir % ptr = ', iptr 

      call funx_closedir ( iptr, errno )

      write(*,*) 'After we close the DIR.    errno = ', errno 

      call funx_perror ( 't_makeindex_01.f90', errno )

500   stop 
1     format ( 'Id = ', i9, ',',2x,'Name :', a, ',', 2x, 'Type: ', a )
!--
600   continue  
      write(*,*) "ERROR: can not opendir"
      goto 500 

      end program t_makeindex_01
