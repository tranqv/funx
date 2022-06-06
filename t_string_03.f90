!
!
!
      program t_string_03 
!
      use my_funx
      implicit none 
!
      external    f_utils_chr2str
!
      character(len=*),parameter    :: sti = 'cu pin   '
      integer(kind=ck_size_t),parameter  :: maxlen = 1234
      character,dimension(maxlen)   :: str 
      integer(kind=ck_size_t)       :: lentrim_str, lencrop_str, ls  
!
!
      str = '' 
      call f_utils_chr2str ( sti, str, ls )

      write(*,*) &
      'Test 1: simple initialisation str ="'//sti//'"'

      write(*,*) &
      '   len(sti), len_trim(sti), ls  =', len(sti), len_trim(sti), ls


      call funx_strlentrim ( str, maxlen, lentrim_str )
      write(*,*) 'lentrim_str =', lentrim_str

      call funx_strlencrop ( str, maxlen, lencrop_str )
      write(*,*) 'lencrop_str =', lencrop_str

!
      write(*,*) 'Test 2: add NULL to trim(str)'

      str = '' 
      call f_utils_chr2str ( sti // ck_char_nul, str, ls )

      call funx_strlentrim ( str, maxlen, lentrim_str )
      write(*,*) 'lentrim_str =', lentrim_str

      call funx_strlencrop ( str, maxlen, lencrop_str )
      write(*,*) 'lencrop_str =', lencrop_str

!
      write(*,*) 'Test 3: add CR to trim(str)'

      str = '' 
      call f_utils_chr2str ( sti // ck_char_cr, str, ls )

      call funx_strlentrim ( str, maxlen, lentrim_str )
      write(*,*) 'lentrim_str =', lentrim_str

      call funx_strlencrop ( str, maxlen, lencrop_str )
      write(*,*) 'lencrop_str =', lencrop_str



!
      write(*,*) 'Test 4: add NL to trim(str)'

      str = '' 
      call f_utils_chr2str ( sti // ck_char_lf, str, ls )

      call funx_strlentrim ( str, maxlen, lentrim_str )
      write(*,*) 'lentrim_str =', lentrim_str

      call funx_strlencrop ( str, maxlen, lencrop_str )
      write(*,*) 'lencrop_str =', lencrop_str




!
      write(*,*) 'Test 5: add NL and CR and NULL to trim(str)'

      str = '' 
      call f_utils_chr2str ( &
            sti // ck_char_lf // ck_char_cr // ck_char_nul, str, ls )

      call funx_strlentrim ( str, maxlen, lentrim_str )
      write(*,*) 'lentrim_str =', lentrim_str

      call funx_strlencrop ( str, maxlen, lencrop_str )
      write(*,*) 'lencrop_str =', lencrop_str










      stop 
      end program 
