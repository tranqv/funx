!-----------------------------------------------------------------------
!
!     Get a string from a stream
!
!     ERROR Checking:
!        lt = 0      Error, end-of-file. Should skip the reading.
!        lt = lm-1   OK, s writen fully.
!        lt < lm-1   OK, s writen partly, maybe the reading reaches
!                    the newline char(10) or the carriage char(13) at 
!                    the last character of the s.
!
!     Both the cases of reading OK, use s(1:lt) as the output.
!
!     In the codes below, the value of output 
!        lt 
!     stands for the number of characters which are read successfully. 
!     So, the file offset should be advanced like this: 
!        offset = offset + lt 
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
      subroutine  f_fgets ( file, s, lm, lt ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)         :: file 
      integer(kind=ck_int),intent(in)  :: lm
      character(len=lm),intent(out)    :: s 
      integer(kind=ck_int),intent(out) :: lt
!
      external    c_fgets
!
!
      call c_fgets ( file % ptr, s, lm, lt )
!
!     Since fgets() add the NULL character at the end of the string s,
!     at the (lt+1)-th position, so we should remove it as well. Here
!        lt = = (int) strlen ( s )
!     the strlen() count the number of character in S from the beginning
!     to the next of NULL, i.e. it does not count the NULL. So the NULL
!     will be (lt+1)-th character.
!
      s ( lt+1 : ) = ''
!
      return 
      end subroutine f_fgets
!
!-----
!     Deprecated!
!
!     We can use F_FGETS to pass S directly 
!
      subroutine  f_fgets_array ( file, s, lm, lt ) 
!
      use mod_funx_param, only: ck_file, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)            :: file 
      integer(kind=ck_int),intent(in)     :: lm
      character,dimension(lm),intent(out) :: s 
      integer(kind=ck_int),intent(out)    :: lt
!
      external    c_fgets
!
!
      call c_fgets ( file % ptr, s(1), lm, lt )
      s ( lt+1 : ) = ''
!
      return 
      end subroutine f_fgets_array 
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
      subroutine  f_fgets_intref ( iptr, s, lm, lt ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(in)      :: lm
      character(len=lm),intent(out)        :: s 
      integer(kind=ck_int),intent(out)     :: lt
!
      external    c_fgets_intref
!
!
      call c_fgets_intref ( iptr, s, lm, lt )
      s ( lt+1 : ) = ''
!
      return 
      end subroutine f_fgets_intref
!
!-----
!
!     Deprecated!
!
!     We can use F_FGETS_INTREF to pass S directly 
!
      subroutine  f_fgets_intref_array ( iptr, s, lm, lt ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in) :: iptr 
      integer(kind=ck_int),intent(in)      :: lm
      character,dimension(lm),intent(out)  :: s 
      integer(kind=ck_int),intent(out)     :: lt
!
      external    c_fgets_intref
!
!
      call c_fgets_intref ( iptr, s(1), lm, lt )
      s ( lt+1 : ) = ''
!
      return 
      end subroutine f_fgets_intref_array
!-----------------------------------------------------------------------
