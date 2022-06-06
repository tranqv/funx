!------------------------------------------------------------------------
!
!     This package includes some subroutines which mighe be useful for 
!     other tasks.
!
!------------------------------------------------------------------------
!
!     To convert string from C lang to Fortran lang:
!
!-----
!
      function f_utils_strc2f ( cstr, len_fstr ) result ( fstr )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)               :: cstr
      character(len=index(cstr,ck_char_nul)-1)  :: fstr
      integer(kind=ck_size_t),intent(out)       :: len_fstr
!
!
      len_fstr = index ( cstr, ck_char_nul ) - 1
      fstr(1:len_fstr) = cstr(1:len_fstr)
!
      return
      end function f_utils_strc2f
!
!------------------------------------------------------------------------
!
!     To convert string from Fortran lang to C lang:
!
!-----
!
      function f_utils_strf2c ( fstr, len_cstr ) result ( cstr )
!
      use mod_funx_param, only: ck_size_t, ck_char_nul
      implicit none
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: fstr
      character(len=len(fstr)+1)          :: cstr
      integer(kind=ck_size_t),intent(out) :: len_cstr
!
!
      len_cstr = len ( fstr ) + 1
      cstr(1:len_cstr) = fstr(1:len_cstr-1) // ck_char_nul
!
      return
      end function f_utils_strf2c
!
!------------------------------------------------------------------------
!
!     Take the length of sub-string that is the result from trimming the
!     input string.
!
!-----
      subroutine f_utils_strlentrim ( str, size_str, lentrim_str )
!
      use mod_funx_param, only: ck_size_t, ck_char_lf, ck_char_cr, &
                                ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)  :: size_str
      character(len=size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out) :: lentrim_str
!
!
      lentrim_str = len_trim(str(1:size_str)) 
!
!     Note: the following code does not take the length of trim(str)
!     lentrim_str = len_trim(str) 
!
      return 
      end subroutine f_utils_strlentrim 
!
!-----
!
!!    subroutine f_utils_strlentrim_array ( str, size_str, len_str )
!!    use mod_funx_param, only: ck_size_t, ck_icha_nul
!!    implicit none 
!
!     include     'i_param.inc'
!
!!    integer(kind=ck_size_t),intent(in)        :: size_str
!!    character,dimension(size_str),intent(in)  :: str 
!!    integer(kind=ck_size_t),intent(out)       :: len_str
!
!!    integer(kind=ck_size_t)    i 
!
!     ASCII control characters   : character code  0 -  31
!     ASCII printable characters : character code 32 - 127, where 
!
!        32 == '' (White space)
!
!     Tracking the right most character that is not NULL:
!
!!    len_str = size_str
!!    do i = len_str, 1, -1
!!       if ( ichar( str(i) ) .ne. ck_icha_nul ) goto 100
!!    enddo 
!!    return  ! return if the loop is not executed 
!!100 len_str = i 
!!    return 
!!    end subroutine f_utils_strlentrim_array 
!
!-----
!
      subroutine f_utils_strlentrim_array ( str, size_str, lentrim_str )
!
      use mod_funx_param, only: ck_size_t, ck_icha_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)        :: size_str
      character,dimension(size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out)       :: lentrim_str
!
      external    f_utils_strlentrim
!
!
      call f_utils_strlentrim ( str(1), size_str, lentrim_str )
!
      return 
      end subroutine f_utils_strlentrim_array 
!
!------------------------------------------------------------------------
!
!     Take the length of sub-string that is the result from trimming the
!     input string. Furthermore, the procedure ensures that there is no
!     newline, carriage return, or null at the tail of the sub-string.
!
!-----
!
!     Cut off all control characters leftward from the tail:
!
      subroutine f_utils_strlencrop ( str, size_str, lencrop_str )
!
      use mod_funx_param, only: ck_size_t, ck_char_lf, ck_char_cr, &
                            ck_char_nul
      implicit none
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)  :: size_str
      character(len=size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out) :: lencrop_str
!
      integer(kind=ck_size_t)    i 
      external                   f_utils_strlen
!
!
      call f_utils_strlentrim ( str, size_str, lencrop_str )
!
      do i = lencrop_str, 1, -1
         if ( ichar( str(i:i) ) .gt. 32 ) goto 100 
      enddo
      return  ! return if the loop is not executed  
 100  lencrop_str = i 
      return 
      end subroutine f_utils_strlencrop
!
!-----
!
!     Cut off all control characters leftward from the tail:
!
!!    subroutine f_utils_strlencrop_array ( str, size_str, lencrop_str )
!!    use mod_funx_param, only: ck_size_t, ck_char_lf, ck_char_cr, &
!!                          ck_char_nul
!!    implicit none
!
!     include     'i_param.inc'
!
!!    integer(kind=ck_size_t),intent(in)        :: size_str
!!    character,dimension(size_str),intent(in)  :: str 
!!    integer(kind=ck_size_t),intent(out)       :: lencrop_str
!
!!    external                   f_utils_strlentrim_array
!!    integer(kind=ck_size_t)    i 
!
!     ASCII control characters   : character code  0 -  31
!     ASCII printable characters : character code 32 - 127, where 
!
!        32 == '' (White space)
!
!     Tracking the right most character that is not NULL:
!
!!    call f_utils_strlentrim_array ( str, size_str, lencrop_str )
!
!     Then, continue cutting off all control characters from the tail of
!     STR:
!
!!    do i = lencrop_str, 1, -1
!!       if ( ichar( str(i) ) .gt. 32 ) goto 100 
!!    enddo
!!    return  ! return if the loop is not executed
!!100 lencrop_str = i 
!!    return 
!!    end subroutine f_utils_strlencrop_array 
!
!-----
!
      subroutine  f_utils_strlencrop_array ( str, size_str, lencrop_str)
!
      use mod_funx_param, only: ck_size_t, ck_char_lf, ck_char_cr, &
                            ck_char_nul
      implicit none
!
!     include     'i_param.inc'
!
      integer(kind=ck_size_t),intent(in)        :: size_str
      character,dimension(size_str),intent(in)  :: str 
      integer(kind=ck_size_t),intent(out)       :: lencrop_str
!
      external    f_utils_strlencrop
!
!
      call f_utils_strlencrop ( str(1), size_str, lencrop_str )
!
      return 
      end subroutine f_utils_strlencrop_array
! 
!-----------------------------------------------------------------------
!
      subroutine  f_utils_chr2str ( ch, st, len_st )
!
      use mod_funx_param, only: ck_size_t
      implicit none
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)               :: ch 
      character,dimension(len(ch)),intent(out)  :: st 
      integer(kind=ck_size_t),intent(out)       :: len_st
!
      integer(kind=ck_size_t)    i
!
!
      len_st = len_trim(ch)
      do concurrent ( i = 1:len_st )
         st(i) = ch(i:i)
      enddo
!
      end subroutine f_utils_chr2str
!
!-----------------------------------------------------------------------
!
!     Get memory reference / address of variables in some basic kinds
!
!-----------------------------------------------------------------------
!
!     For integer(4):
!
!-----
      subroutine  f_utils_vgetaddr_int ( var, ref )
!
      use mod_funx_param, only: ck_int, ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_int),      intent(in)  :: var
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external    c_utils_vgetaddr
!
!
      call c_utils_vgetaddr ( var, ref )
      return 
      end subroutine  f_utils_vgetaddr_int
!-----------------------------------------------------------------------
!
!     For integer(8):
!
!-----
!
      subroutine  f_utils_vgetaddr_long ( var, ref )
!
      use mod_funx_param, only: ck_intptr_t, ck_long
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_long),     intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external    c_utils_vgetaddr
!
!
      call c_utils_vgetaddr ( var, ref )
      return 
      end subroutine  f_utils_vgetaddr_long
!-----------------------------------------------------------------------
!
!     For real(4):
!
!-----
!
      subroutine  f_utils_vgetaddr_float ( var, ref )
!
      use mod_funx_param, only: ck_float, ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      real(kind=ck_float),       intent(in)  :: var
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external    c_utils_vgetaddr
!
!
      call c_utils_vgetaddr ( var, ref )
      return
      end subroutine  f_utils_vgetaddr_float
!-----------------------------------------------------------------------
!
!     For real(8):
!
!-----
!
!
      subroutine  f_utils_vgetaddr_double ( var, ref )
!
      use mod_funx_param, only: ck_double, ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      real(kind=ck_double),      intent(in)  :: var
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external    c_utils_vgetaddr
!
!
      call c_utils_vgetaddr ( var, ref )
      return 
      end subroutine  f_utils_vgetaddr_double 
!-----------------------------------------------------------------------
!
!     For character:
!
!-----
!
      subroutine  f_utils_vgetaddr_char ( var, ref )
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=1),          intent(in)  :: var
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external    c_utils_vgetaddr
!
!
      call c_utils_vgetaddr ( var, ref )
      return
      end subroutine  f_utils_vgetaddr_char  
!-----------------------------------------------------------------------
!
!     For character:
!
!-----
!
      subroutine  f_utils_vgetaddr_str  ( var, ref )
!
      use mod_funx_param, only: ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),          intent(in)  :: var 
      integer(kind=ck_intptr_t), intent(out) :: ref 
!
      external    c_utils_vgetaddr
!
!
      call c_utils_vgetaddr ( var, ref )
      return 
      end subroutine  f_utils_vgetaddr_str   
!-----------------------------------------------------------------------
!
!     Get value of a variable from its memory reference / address
!
!-----------------------------------------------------------------------
!
!     For integer(4):
!
!-----
      subroutine  f_utils_vgetinfo_int ( ref, var )
!
      use mod_funx_param, only: ck_int, ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      integer(kind=ck_int),      intent(out) :: var 
!
      external    c_utils_vgetinfo_int 
!
!
      call c_utils_vgetinfo_int ( ref, var )
      return 
      end subroutine  f_utils_vgetinfo_int
!-----------------------------------------------------------------------
!
!     For integer(8):
!
!-----
      subroutine  f_utils_vgetinfo_long ( ref, var )
!
      use mod_funx_param, only: ck_long, ck_intptr_t
      implicit none
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      integer(kind=ck_long),     intent(out) :: var 
!
      external    c_utils_vgetinfo_long 
!
!
      call c_utils_vgetinfo_long ( ref, var )
      return 
      end subroutine  f_utils_vgetinfo_long
!-----------------------------------------------------------------------
!
!     For real(4):   
!
!-----
      subroutine  f_utils_vgetinfo_float ( ref, var )
!
      use mod_funx_param, only: ck_float, ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      real(kind=ck_float),       intent(out) :: var 
!
      external    c_utils_vgetinfo_float 
!
!
      call c_utils_vgetinfo_float ( ref, var )
      return 
      end subroutine  f_utils_vgetinfo_float
!-----------------------------------------------------------------------
!
!     For real(8):   
!
!-----
      subroutine  f_utils_vgetinfo_double ( ref, var )
!
      use mod_funx_param, only: ck_double, ck_intptr_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      real(kind=ck_double),      intent(out) :: var 
!
      external    c_utils_vgetinfo_double 
!
!
      call c_utils_vgetinfo_double ( ref, var )
      return 
      end subroutine  f_utils_vgetinfo_double
!-----------------------------------------------------------------------
!
!     For character(len=*):
!
!-----
      subroutine  f_utils_vgetinfo_char ( &
                  ref, var, len_var, lentrim_var )
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t), intent(in)  :: ref 
      integer(kind=ck_size_t), intent(in)    :: len_var
      character(len=len_var),intent(inout)   :: var 
      integer(kind=ck_size_t), intent(out)   :: lentrim_var
!
      external    c_utils_vgetinfo_char 
!
!
      call c_utils_vgetinfo_char ( ref, var, len_var, lentrim_var )
      return 
      end subroutine  f_utils_vgetinfo_char
!
!-----------------------------------------------------------------------
!
!     Convert permission among octal and decimal integers, or 
!     string form.
!
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!
      subroutine  f_utils_dec2oct ( idec, ioct )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_mode_t),intent(in)   :: idec 
      integer(kind=ck_mode_t),intent(out)  :: ioct 
!
      external    c_utils_dec2oct
!
!     511 --> 777
!
      call c_utils_dec2oct ( idec, ioct ) 
!
      return 
      end subroutine  f_utils_dec2oct
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!
      subroutine  f_utils_oct2dec ( ioct, idec )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_mode_t),intent(in)   :: ioct 
      integer(kind=ck_mode_t),intent(out)  :: idec 
!
      external    c_utils_oct2dec
!     777 --> 511 
!
      call c_utils_oct2dec ( ioct, idec ) 
!
      return 
      end subroutine  f_utils_oct2dec
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 10, i.e. 10 bytes.
!
!-----
      subroutine  f_utils_oct2per ( ioct, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_mode_t),intent(in)  :: ioct 
      character(len=*),intent(inout)      :: str 
!
      external    c_utils_oct2per 
!
!     777   --> rwxrwxrwx
!
      call c_utils_oct2per ( ioct, str ) 
      str(10:) = '' 
!
      return 
      end subroutine  f_utils_oct2per
!-----------------------------------------------------------------------
!
      subroutine  f_utils_per2oct ( str, ioct )
!
      use mod_funx_param, only: ck_mode_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: ioct 
!
      external    c_utils_per2oct
!
!     rwxrwxrwx --> 777
!
      call c_utils_per2oct ( str//ck_char_nul, ioct )
!
      return 
      end subroutine  f_utils_per2oct
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 10, i.e. 10 bytes.
!
!-----
      subroutine  f_utils_dec2per ( ioct, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_mode_t),intent(in)  :: ioct 
      character(len=*),intent(inout)      :: str 
!
      external    c_utils_dec2per 
!
!     511   --> rwxrwxrwx
!
      call c_utils_dec2per ( ioct, str ) 
      str(10:) = '' 
!
      return 
      end subroutine  f_utils_dec2per
!-----------------------------------------------------------------------
!
      subroutine  f_utils_per2dec ( str, ioct )
!
      use mod_funx_param, only: ck_mode_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: ioct 
!
      external    c_utils_per2dec
!
!     rwxrwxrwx --> 511
!
      call c_utils_per2dec ( str//ck_char_nul, ioct )
!
      return 
      end subroutine  f_utils_per2dec
!-----------------------------------------------------------------------
!
!     FUP:  Fully Unix Permission 
!
!     str = 'drwxrwxrwx UGS'
!            123456789|||||
!                    10||||
!                     11|||
!                      12||
!                       13|
!                        14
!     str(1:1)
!        -  regular file 
!        l  symbolic link 
!        d  directory 
!        b  block device 
!        c  character device 
!        p  FIFO special file  
!        s  Socket file  
!     str(12:12)
!        U  set-user-ID on execute bit
!        -  not set 
!     str(13:13)
!        G  set-group-ID on execute bit
!        -  not set 
!     str(14:14)
!        S  set sticky bit
!        -  not set 
!
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 14, i.e. 14 bytes.
!
      subroutine  f_utils_oct2fup ( ioct, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_mode_t),intent(in)  :: ioct 
      character(len=*),intent(inout)      :: str 
!
      external    c_utils_oct2fup 
!
!     777   --> rwxrwxrwx
!
      call c_utils_oct2fup ( ioct, str ) 
      str(15:) = '' 
!
      return 
      end subroutine  f_utils_oct2fup
!-----------------------------------------------------------------------
!
      subroutine  f_utils_fup2oct ( str, ioct )
!
      use mod_funx_param, only: ck_mode_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: ioct 
!
      external    c_utils_fup2oct
!
!     rwxrwxrwx --> 777
!
      call c_utils_fup2oct ( str//ck_char_nul, ioct )
!
      return 
      end subroutine  f_utils_fup2oct
!-----------------------------------------------------------------------
!
!     dependence: i_utils.h
!
!     str must have length at least of 14, i.e. 14 bytes.
!
      subroutine  f_utils_dec2fup ( idec, str )
!
      use mod_funx_param, only: ck_mode_t
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_mode_t),intent(in)  :: idec 
      character(len=*),intent(inout)      :: str 
!
      external    c_utils_dec2fup 
!
!     511   --> rwxrwxrwx
!
      call c_utils_dec2fup ( idec, str ) 
      str(15:) = '' 
!
      return 
      end subroutine  f_utils_dec2fup
!-----------------------------------------------------------------------
!
      subroutine  f_utils_fup2dec ( str, idec )
!
      use mod_funx_param, only: ck_mode_t, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      character(len=*),intent(in)         :: str 
      integer(kind=ck_mode_t),intent(out) :: idec 
!
      external    c_utils_fup2dec
!
!     rwxrwxrwx --> 511
!
      call c_utils_fup2dec ( str//ck_char_nul, idec )
!
      return 
      end subroutine  f_utils_fup2dec
!-----------------------------------------------------------------------
!
!
!
      subroutine  f_utils_scalebyte ( isize, rsize, unitstr ) 
!
      use mod_funx_param, only: ck_off_t, ck_float
      implicit none
!
!     include  'i_param.inc'
!
      integer(ck_off_t),intent(in)  :: isize
      real(ck_float),intent(out)    :: rsize
      character(len=3),intent(out)  :: unitstr
!
      external    c_utils_scalebyte
!
!
      call c_utils_scalebyte ( isize, rsize, unitstr )
      unitstr(3:) = '' 
!
      return 
      end subroutine f_utils_scalebyte 
!
!------------------------------------------------------------------------
!


!------------------------------------------------------------------------
!
!------------------------------------------------------------------------
!
!------------------------------------------------------------------------
!
!------------------------------------------------------------------------
!
!------------------------------------------------------------------------
!
!------------------------------------------------------------------------
!
!------------------------------------------------------------------------
!
!------------------------------------------------------------------------
!

