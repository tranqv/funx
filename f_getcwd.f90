!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_getcwd ( path, size_path, lentrim_path )
!
      use mod_funx_param, only: ck_size_t, ck_int 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)     :: size_path
      character(len=size_path),intent(out)   :: path
      integer(kind=ck_size_t),intent(out)    :: lentrim_path 
!
      external    c_getcwd
!
!
      lentrim_path = -1 
      call c_getcwd ( path, size_path, lentrim_path )
!
      end subroutine f_getcwd
!
!-----------------------------------------------------------------------
!
      subroutine  f_getcwd_array ( path, size_path, lentrim_path )
!
      use mod_funx_param, only: ck_size_t, ck_int 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)           :: size_path
      character,dimension(size_path),intent(out)   :: path
      integer(kind=ck_size_t),intent(out)          :: lentrim_path 
!
      external    c_getcwd
!
!
      lentrim_path = -1 
      call c_getcwd ( path(1), size_path, lentrim_path )
!
      end subroutine f_getcwd_array
!
!-----------------------------------------------------------------------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  f_getcwd_alloc ( path, size_path )
!
      use mod_funx_param, only: ck_size_t 
      implicit none 
!
!     include     'i_param.inc'
!
      character,dimension(:),allocatable,intent(out)  :: path
      integer(kind=ck_size_t),intent(out)             :: size_path 
!
      external    c_getcwd_prep, c_getcwd_post 
!
!
      call  c_getcwd_prep ( size_path )
      if ( size_path .le. 0 ) return 
      if ( allocated(path) ) deallocate(path)
      allocate ( path(1:size_path) )
      call  c_getcwd_post ( size_path, path(1) )
!
      return 
      end subroutine f_getcwd_alloc
!
!-----------------------------------------------------------------------
!
!     We work with allocatable character (f2003 enhance)
!
!-----
      subroutine  f_getcwd_dynch ( path, size_path )
!
      use mod_funx_param, only: ck_size_t 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=:),allocatable,intent(out)  :: path
      integer(kind=ck_size_t),intent(out)       :: size_path 
!
      external    c_getcwd_prep, c_getcwd_post 
!
!
      call  c_getcwd_prep ( size_path )
      if ( size_path .le. 0 ) return 
      if ( allocated(path) ) deallocate(path)
      allocate ( character(len=size_path) :: path )
      call  c_getcwd_post ( size_path, path )
!
      return 
      end subroutine f_getcwd_dynch
!
!-----------------------------------------------------------------------
