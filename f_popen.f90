!-----------------------------------------------------------------------
!
!     Create a new stream connected to a pipe running the given command,
!     initiate pipe streams to or from a process
!     
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_popen ( file, command, mode, istat ) 
!
      use mod_funx_param, only: ck_file, ck_int, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(inout)   :: file 
      character(len=*),intent(in)   :: command 
      character(len=*),intent(in)   :: mode 
      integer(kind=ck_int),intent(out) :: istat  
!
      external    c_popen 
!
!
      call c_popen ( &
           file % ptr, command//ck_char_nul, mode//ck_char_nul, istat )
!
      return 
      end subroutine f_popen
!
!-----------------------------------------------------------------------
!
!     New version: 
!        Pass arguments using its reference with value in integer(8),
!        i.e. intptr_t defined in /usr/include/stdint.h
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_popen_intref ( iptr, command, mode, istat ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int, ck_char_nul 
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(out) :: iptr 
      character(len=*),intent(in)   :: command 
      character(len=*),intent(in)   :: mode 
      integer(kind=ck_int),intent(out) :: istat  
!
      external    c_popen_intref 
!
!
      call c_popen_intref ( &
           iptr, command//ck_char_nul, mode//ck_char_nul, istat )
!
      return 
      end subroutine f_popen_intref
!
!-----------------------------------------------------------------------
