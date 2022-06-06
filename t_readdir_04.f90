

      program t_readdir_04
!
      use my_funx
      implicit none 
!
      character,dimension(ck_name_max) :: fname
      integer(kind=ck_int)    :: errno
      integer(kind=ck_size_t) :: len_fname, lentrim_fname
      integer(kind=ck_intptr_t)  iptr 
!
      integer :: id 
!     external funx_opendir, funx_rewinddir, funx_readdir, &
!              funx_closedir, funx_perror, funx_getarg
!
      character(len=99)          arg1
      integer(kind=ck_size_t)    len_arg1, lentrim_arg1
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

!     call funx_opendir ( arg1(1:lentrim_arg1), dir, errno )
!     call funx_rewinddir ( dir, errno )

      iptr = 0
!     call f_opendir ( arg1(1:lentrim_arg1), iptr )
      call funx_opendir ( arg1(1:lentrim_arg1), iptr, errno )

      if ( iptr .eq. 0 ) goto 600

!     call f_rewinddir ( iptr )
      call funx_rewinddir ( iptr, errno )

      len_fname = size(fname)

      id = 0 
      do 
         id = id + 1 

!        call f_readdir ( iptr, fname, len_fname, lentrim_fname )
!        call funx_readdir ( &
         call funx_readdir ( &
              iptr, fname, len_fname, lentrim_fname, errno )

         if ( lentrim_fname < 0 ) then
            write(*,*) 'reaching the end of folder ?'
            exit  
         endif 

         write(*,*) id, fname(1:lentrim_fname)

      enddo

      write(*,*) 'At the end of reading DIR. errno = ', errno 
      write(*,*) 'where the dir handler pointer dir % ptr = ', iptr 

!     call f_closedir ( iptr )
      call funx_closedir ( iptr, errno )

      write(*,*) 'After we close the DIR.    errno = ', errno 

      call funx_perror ( 't_readdir_04.f90', errno )

500   stop 
!--
600   continue  
      write(*,*) "ERROR: can not opendir"
      goto 500 

      end program t_readdir_04
