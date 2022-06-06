!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_abspath ( &
                  fname, path, len_path, lentrim_path ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: fname
      integer(kind=ck_size_t),intent(in)  :: len_path
      character(len=len_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out) :: lentrim_path 
!
      external    c_abspath 
!
!
      lentrim_path = -1 
      call c_abspath ( fname//ck_char_nul, path, len_path, lentrim_path)
      if ( lentrim_path .gt. 0 ) path( lentrim_path+1 : len_path ) = ''
!
      return 
      end subroutine f_abspath 
!
!-----------------------------------------------------------------------
!
      subroutine  f_abspath_array ( &
                  fname, path, len_path, lentrim_path ) 
!  
      use mod_funx_param, only: ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)               :: fname
      integer(kind=ck_size_t),intent(in)        :: len_path
      character,dimension(len_path),intent(out) :: path 
      integer(kind=ck_size_t),intent(out)       :: lentrim_path 
!
      external    c_abspath 
!
!
      lentrim_path = -1 
      call  c_abspath ( &
            fname//ck_char_nul, path(1), len_path, lentrim_path )
      if ( lentrim_path .gt. 0 ) path( lentrim_path+1 : len_path ) = ''
!
      return 
      end subroutine f_abspath_array
!
!-----------------------------------------------------------------------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  f_abspath_alloc ( fname, apath, len_apath )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)                     :: fname
      character,dimension(:),allocatable,intent(out)  :: apath
      integer(kind=ck_size_t),intent(out)             :: len_apath 
!
      external    c_abspath_prep, c_abspath_post 
!
!
      call  c_abspath_prep ( fname // ck_char_nul, len_apath )
      if ( len_apath .le. 0 ) return 
      if ( allocated(apath) ) deallocate(apath)
      allocate ( apath(1:len_apath) )
      call  c_abspath_post ( len_apath, apath(1) )
!
      return 
      end subroutine f_abspath_alloc
!
!-----------------------------------------------------------------------
!
!     We work with allocatable character (f2003 enhance).
!
!-----
      subroutine  f_abspath_dynch ( fname, apath, len_apath )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)               :: fname
      character(len=:),allocatable,intent(out)  :: apath
      integer(kind=ck_size_t),intent(out)       :: len_apath 
!
      external    c_abspath_prep, c_abspath_post 
!
!
      call  c_abspath_prep ( fname // ck_char_nul, len_apath )
      if ( len_apath .le. 0 ) return 
      if ( allocated(apath) ) deallocate(apath)
      allocate ( character(len=len_apath) :: apath )
      call  c_abspath_post ( len_apath, apath )
!
      return 
      end subroutine f_abspath_dynch
!
!-----------------------------------------------------------------------
