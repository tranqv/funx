!-----------------------------------------------------------------------
!
!     Probing files using the C_STAT function
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      function    f_is_dir ( path )  result ( res )
! 
      use mod_funx_param, only: ck_int, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_dir
!
!
      res = .false. 
!
      call c_is_dir ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_dir 
!
!-----------------------------------------------------------------------
!
      function    f_is_reg ( path )  result ( res )
!  
      use mod_funx_param, only: ck_int, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_reg
!
!
      res = .false. 
!
      call c_is_reg ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_reg 
!
!-----------------------------------------------------------------------
!
      function    f_is_blkdev ( path )  result ( res )
!  
      use mod_funx_param, only: ck_int, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_blkdev
!
!
      res = .false. 
!
      call c_is_blkdev ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_blkdev 
!
!-----------------------------------------------------------------------
!
      function    f_is_chrdev ( path )  result ( res )
!
      use mod_funx_param, only: ck_int, ck_char_nul  
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_chrdev
!
!
      res = .false. 
!
      call c_is_chrdev ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_chrdev 
!
!-----------------------------------------------------------------------
!
      function    f_is_fifo ( path )  result ( res )
! 
      use mod_funx_param, only: ck_int, ck_char_nul  
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_fifo
!
!
      res = .false. 
!
      call c_is_fifo ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_fifo 
!
!-----------------------------------------------------------------------
!
      function    f_is_socket ( path )  result ( res )
!
      use mod_funx_param, only: ck_int, ck_char_nul   
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_socket
!
!
      res = .false. 
!
      call c_is_socket ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_socket 
!
!-----------------------------------------------------------------------
!
      function    f_is_link ( path )  result ( res )
!  
      use mod_funx_param, only: ck_int, ck_char_nul   
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_link
!
!
      res = .false. 
!
      call c_is_link ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_link 
!
!-----------------------------------------------------------------------
!
      function    f_is_exist ( path )  result ( res )
!
      use mod_funx_param, only: ck_int, ck_char_nul    
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      integer(kind=ck_int)    ire  
      external                c_is_exist
!
!
      res = .false. 
!
      call c_is_exist ( path//ck_char_nul, ire )
!
      if ( ire .ne. 0 ) res = .true. 
      return 
      end function f_is_exist 
!
!-----------------------------------------------------------------------
!
!     Probing files using the C_ACCESS function
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----------------------------------------------------------------------
!  
!     is path readable ? based on the current UID and GID 
!
!
      function    f_is_r_ok ( path )  result ( res )
!
      use mod_funx_param, only: ck_int, ck_char_nul, ck_r_ok     
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      external                c_access 
      integer(kind=ck_int)    ire   
!
!
      res = .false. 
      call c_access ( path//ck_char_nul, ck_r_ok, ire )
      if ( ire .eq. 0 ) res = .true. 
      return 
      end function f_is_r_ok
!-----------------------------------------------------------------------
!  
!     is path writable ? based on the current UID and GID 
!
!
      function    f_is_w_ok ( path )  result ( res )
!  
      use mod_funx_param, only: ck_int, ck_char_nul, ck_w_ok     
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      external                c_access 
      integer(kind=ck_int)    ire   
!
!
      res = .false. 
      call c_access ( path//ck_char_nul, ck_w_ok, ire )
      if ( ire .eq. 0 ) res = .true. 
      return 
      end function f_is_w_ok
!-----------------------------------------------------------------------
!  
!     is path executable ? based on the current UID and GID 
!
!
      function    f_is_x_ok ( path )  result ( res )
!  
      use mod_funx_param, only: ck_int, ck_char_nul, ck_x_ok     
      implicit none 
!
!     include     'i_param.inc'
!
      logical     res
      character(len=*),intent(in) :: path
!
      external                c_access 
      integer(kind=ck_int)    ire   
!
!
      res = .false. 
      call c_access ( path//ck_char_nul, ck_x_ok, ire )
      if ( ire .eq. 0 ) res = .true. 
      return 
      end function f_is_x_ok
!
!-----------------------------------------------------------------------
!
