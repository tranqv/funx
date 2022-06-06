!-----------------------------------------------------------------------
!
!     Read binary (in byte) from stream
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----------------------------------------------------------------------
!
!     Hint: 
!
!     1. Code using array of chacracter (e.g. character s(.)) when 
!     compiled with 
!        -O3 -fstack-arrays -finit-local-zero
!     can run very fast in comparison with character(len=.). Look -O3.
!
!-----------------------------------------------------------------------
!
      subroutine  f_fread_astr ( &
                  file, astr, len_astr, lentrim_astr ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)               :: file 
      integer(kind=ck_size_t),intent(in)     :: len_astr
      character(len=len_astr),intent(inout)  :: astr 
      integer(kind=ck_size_t),intent(out)    :: lentrim_astr 
!
      external                   c_fread_astr
      integer(kind=ck_size_t)    m 
!
!
      astr = '' 
!
      call c_fread_astr ( file % ptr, astr, len_astr, m )
!
!     We know that m = 0 (done) or 1 (some error).
!
!     write(*,*) 'len_astr, m = ', len_astr, m

      if ( m .eq. 0 ) then 
!        m=0:
!
!        astr read the stream fully. Read end-of-file. Here we 
!        truncate the astr.
!
!        lentrim_astr = index ( astr, ck_char_nul ) - 1
!        if ( lentrim_astr .lt. 0 ) then
            lentrim_astr = len_trim(astr)
!        else 
            astr ( lentrim_astr+1 : ) = ''
!        endif

      else 
!        m=1:
!
!        astr read the stream partly. Read error. Mostly the length of 
!        the buffer astr is not large enough to capture all the stream.
!        We may need a loop via using the fseek() with 
!           offset := offset + len_astr
!        to advance the reading.
!
         lentrim_astr = len_astr
!
      endif 
      return 
      end subroutine f_fread_astr
!
!-----
!
!     Deprecated!
!
!     We can use F_FREAD_ASTR to pass ASTR directly.
!
!
      subroutine  f_fread_astr_array ( &
                  file, astr, len_astr, lentrim_astr ) 
!
      use mod_funx_param, only: ck_file, ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      type(ck_file),intent(in)                  :: file 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(out) :: astr 
      integer(kind=ck_size_t),intent(out)       :: lentrim_astr 
!
      external                   c_fread_astr
      integer(kind=ck_size_t)    m, i 
!
!
      astr(1:len_astr) = ck_char_nul

      call c_fread_astr ( file % ptr, astr(1), len_astr, m )

      if ( m .eq. 0 ) then 
         do i = len_astr, 1, -1
            if ( astr(i) .ne. ck_char_nul ) then
               exit 
            else
               astr(i) = '' 
            endif 
         enddo
         lentrim_astr = i  
      else 
         lentrim_astr = len_astr
      endif 
!
      return 
      end subroutine f_fread_astr_array 
!
!-----------------------------------------------------------------------
!
!     New version: 
!        Pass arguments using its reference with value in integer(8), i.e.  
!        intptr_t defined in /usr/include/stdint.h
!
!-----------------------------------------------------------------------
!
!     Level 1:
!
!-----
!
      subroutine  f_fread_astr_intref ( &
                  iptr, astr, len_astr, lentrim_astr ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)   :: iptr 
      integer(kind=ck_size_t),intent(in)     :: len_astr
      character(len=len_astr),intent(inout)  :: astr 
      integer(kind=ck_size_t),intent(out)    :: lentrim_astr 
!
      external    c_fread_astr_intref
      integer(kind=ck_size_t)    m 
!
!
      astr = '' 
      call c_fread_astr_intref ( iptr, astr, len_astr, m )
      if ( m .eq. 0 ) then 
         lentrim_astr = len_trim(astr)
         astr ( lentrim_astr+1 : ) = ''
      else 
         lentrim_astr = len_astr
      endif 
      return 
      end subroutine f_fread_astr_intref
!
!-----
!
!     Deprecated!
!
!     We can use F_FREAD_INTREF_ASTR to pass ASTR directly.
!
!
      subroutine  f_fread_astr_intref_array ( &
                  iptr, astr, len_astr, lentrim_astr ) 
!
      use mod_funx_param, only: ck_intptr_t, ck_size_t, ck_int, ck_char_nul
      implicit none 
!
!     include     'i_param.inc'
!
      integer(kind=ck_intptr_t),intent(in)      :: iptr 
      integer(kind=ck_size_t),intent(in)        :: len_astr
      character,dimension(len_astr),intent(out) :: astr 
      integer(kind=ck_size_t),intent(out)       :: lentrim_astr 
!
      external                   c_fread_astr_intref
      integer(kind=ck_size_t)    m, i 
!
!
      astr(1:len_astr) = '' 

      call c_fread_astr_intref ( iptr, astr(1), len_astr, m )

      if ( m .eq. 0 ) then 
         do i = 1, len_astr
            if ( astr(i) .eq. ck_char_nul ) exit 
         enddo
         lentrim_astr = i - 1 
         astr ( lentrim_astr+1 : len_astr ) = ''
      else 
         lentrim_astr = len_astr
      endif 
!
      return 
      end subroutine f_fread_astr_intref_array 
!
!-----------------------------------------------------------------------
