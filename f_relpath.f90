!-----------------------------------------------------------------------
!
!     Obtain relative path of fname, save to path(1:lentrim_path)
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_relpath ( &
                  fname, path, size_path, lentrim_path ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: fname
      integer(kind=ck_size_t),intent(in)  :: size_path
      character(len=size_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out) :: lentrim_path 
!
      external    c_relpath 
!
! 
!     if fname = '/', we should exit with warnings, since we can not get
!     the parent of '/', thus, cannot use '..'.
! 
      if ( trim(fname) .eq. '/' ) then 
         print '(/,a,/)', &
            "Hey. Are you kidding me? It's your ROOT! &
            & This path has no parent. It should be fine if you try &
            & with any one which has a parent, e.g. /bin. OK? "
         lentrim_path = 1
         path = '/'
         return 
      endif 
!
      lentrim_path = -1 
      call  c_relpath ( &
            fname//ck_char_nul, path, size_path, lentrim_path )
      if ( lentrim_path .gt. 0 ) path( lentrim_path+1 : size_path ) = ''
!
      end subroutine f_relpath 
!
!-----------------------------------------------------------------------
!
      subroutine  f_relpath_array ( &
                  fname, path, size_path, lentrim_path ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)                  :: fname
      integer(kind=ck_size_t),intent(in)           :: size_path
      character,dimension(size_path),intent(out)   :: path 
      integer(kind=ck_size_t),intent(out)          :: lentrim_path 
!
      external    c_relpath 
!
! 
!     if fname = '/', we should exit with warnings, since we can not get
!     the parent of '/', thus, cannot use '..'.
! 
      if ( trim(fname) .eq. '/' ) then 
         print '(/,a,/)', &
            "Hey. Are you kidding me? It's your ROOT! &
            & This path has no parent. It should be fine if you try &
            & with any one which has a parent, e.g. /bin. OK? "
         lentrim_path = 1
         path = '/'
         return 
      endif 
!
      lentrim_path = -1 
      call  c_relpath ( &
            fname//ck_char_nul, path(1), size_path, lentrim_path )
      if ( lentrim_path .gt. 0 ) path( lentrim_path+1 : size_path ) = ''
!
      end subroutine f_relpath_array 
!
!-----------------------------------------------------------------------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  f_relpath_alloc ( fname, path, size_path )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)                     :: fname
      character,dimension(:),allocatable,intent(out)  :: path
      integer(kind=ck_size_t),intent(out)             :: size_path 
!
      external    c_relpath_prep, c_relpath_post 
!
!
      call  c_relpath_prep ( fname // ck_char_nul, size_path )
      if ( size_path .le. 0 ) return 
      if ( allocated(path) ) deallocate(path)
      allocate ( path(1:size_path) )
      call  c_relpath_post ( size_path, path(1) )
!
      return 
      end subroutine f_relpath_alloc
!
!-----------------------------------------------------------------------
!
!     We work with allocatable character (f2003 enhance).
!
!-----
      subroutine  f_relpath_dynch ( fname, path, size_path )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)              :: fname
      character(len=:),allocatable,intent(out) :: path
      integer(kind=ck_size_t),intent(out)      :: size_path 
!
      external    c_relpath_prep, c_relpath_post 
!
!
      call  c_relpath_prep ( fname // ck_char_nul, size_path )
      if ( size_path .le. 0 ) return 
      if ( allocated(path) ) deallocate(path)
      allocate ( character(len=size_path) :: path )
      call  c_relpath_post ( size_path, path )
!
      return 
      end subroutine f_relpath_dynch
!-----------------------------------------------------------------------
!
!-----------------------------------------------------------------------
!

