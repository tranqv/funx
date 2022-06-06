!-----------------------------------------------------------------------
!
!     NOTE:
!     +  Input:
!           ENVN must be trimmed as inputting 
!     +  Output:
!           ENVV has 2 parameters: 
!              maximun length (len_envv) & real length (lentrim_envv) 
!           Before calling:  len_envv = len(envv)
!           After calling, lentrim_envv is same as len_trim(envv)
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_getenv ( &
                  envn, envv, len_envv, lentrim_envv )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: envn
      integer(kind=ck_size_t),intent(in)  :: len_envv
      character(len=len_envv),intent(out) :: envv
      integer(kind=ck_size_t),intent(out) :: lentrim_envv 
!
      external    c_getenv
!
!
      lentrim_envv = -1 
      call c_getenv ( envn//ck_char_nul, envv, len_envv, lentrim_envv )
      if ( lentrim_envv .gt. 0 ) envv ( lentrim_envv+1 : len_envv ) = ''
!
      return 
      end subroutine f_getenv
!-----------------------------------------------------------------------
!
!     Level 2:
!
!-----------------------------------------------------------------------
!
!     We can work with array of character.
!
!-----
      subroutine  f_getenv_array ( &
                  envn, envv, len_envv, lentrim_envv )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)               :: envn
      integer(kind=ck_size_t),intent(in)        :: len_envv
      character,dimension(len_envv),intent(out) :: envv
      integer(kind=ck_size_t),intent(out)       :: lentrim_envv 
!
      external    c_getenv
!
!
      lentrim_envv = -1 
      call  c_getenv ( &
            envn // ck_char_nul, envv(1), len_envv, lentrim_envv )
      if ( lentrim_envv .gt. 0 ) envv ( lentrim_envv+1 : len_envv ) = ''
!
      return 
      end subroutine f_getenv_array
!
!-----------------------------------------------------------------------
!
!     We work with allocatable array of character.
!
!-----
      subroutine  f_getenv_alloc ( envn, envv, len_envv )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)                     :: envn
      character,dimension(:),allocatable,intent(out)  :: envv
      integer(kind=ck_size_t),intent(out)             :: len_envv 
!
      external    c_getenv_prep, c_getenv_post 
!
!
      call  c_getenv_prep ( envn // ck_char_nul, len_envv )
      if ( len_envv .le. 0 ) return 
      if ( allocated(envv) ) deallocate(envv)
      allocate ( envv(1:len_envv) )
      call  c_getenv_post ( len_envv, envv(1) )
!
      return 
      end subroutine f_getenv_alloc
!
!-----------------------------------------------------------------------
!
!     We work with allocatable character (fortran 2003 enhance).
!
!-----
      subroutine  f_getenv_dynch ( envn, envv, len_envv )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)              :: envn
      character(len=:),allocatable,intent(out) :: envv
      integer(kind=ck_size_t),intent(out)      :: len_envv 
!
      external    c_getenv_prep, c_getenv_post 
!
!
      call  c_getenv_prep ( envn // ck_char_nul, len_envv )
      if ( len_envv .le. 0 ) return 
      if ( allocated(envv) ) deallocate(envv)
      allocate ( character(len=len_envv) ::  envv )
      call  c_getenv_post ( len_envv, envv )
!
      return 
      end subroutine f_getenv_dynch
!
!-----------------------------------------------------------------------
