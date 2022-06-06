

   program t_readdir_01
!
   use my_funx 
   implicit none 
!
!  include     'i_param.inc'

   type(ck_dir) :: dir
   character(len=128) :: fname
   integer :: id 
   integer(kind=ck_int)    :: errno
   integer(kind=ck_size_t) :: len_fname, lentrim_fname 
!
!  external funx_opendir, funx_rewinddir, funx_readdir, funx_closedir, &
!           funx_perror 
!
!
   call funx_opendir ( '.', dir, errno )
   call funx_rewinddir ( dir, errno )

   len_fname = len(fname)

   print *, 'len_fname = ', len_fname 

   id = 0 
   do 
      id = id + 1 

      call funx_readdir ( dir, fname, len_fname, lentrim_fname, errno )

      if ( lentrim_fname < 0 ) then
         write(*,*) 'reaching the end of folder ?'
         exit 
      endif 

      write(*,1) id, fname(1:lentrim_fname)

   enddo

   write(*,*) 'At the end of reading DIR. errno = ', errno 
   write(*,*) 'where the dir handler pointer dir % ptr = ', dir % ptr 

   call funx_closedir ( dir, errno )

   write(*,*) 'After we close the DIR.    errno = ', errno 

   call funx_perror ( 't_readdir_01.f90', errno )


1  format ( i9, 3x,  a )

   end program t_readdir_01
