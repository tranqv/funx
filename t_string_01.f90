!
!
!
      program t_string_01 
!
      use my_funx
      implicit none 
!
      integer,parameter       :: maxlen = 1234
      character(len=maxlen)      str 
      integer(kind=ck_size_t)    len_str, ls  
!
!
      str = 'cu pin   '
      ls  = len_trim(str)
!
      write(*,*) 'Test 1: simple initialisation str ="'//trim(str)//'"'

      call f_utils_strlentrim ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str

      call f_utils_strlentrim ( trim(str), len_trim(str), len_str )
      write(*,*) 'input= trim(str) :', len(str), len_trim(str), len_str 

      call f_utils_strlencrop ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str

!
      write(*,*) 'Test 2: add NULL to trim(str)'

      str = str(1:ls) // ck_char_nul 

      call f_utils_strlentrim ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str

      call f_utils_strlentrim ( trim(str), len_trim(str), len_str )
      write(*,*) 'input= trim(str) :', len(str), len_trim(str), len_str 

      call f_utils_strlencrop ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str

!
      write(*,*) 'Test 3: add CR to trim(str)'

      str = str(1:ls) // ck_char_cr

      call f_utils_strlentrim ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str

      call f_utils_strlentrim ( trim(str), len_trim(str), len_str )
      write(*,*) 'input= trim(str) :', len(str), len_trim(str), len_str 

      call f_utils_strlencrop ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str


!
      write(*,*) 'Test 4: add NL to trim(str)'

      str = str(1:ls) // ck_char_lf

      call f_utils_strlentrim ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str

      call f_utils_strlentrim ( trim(str), len_trim(str), len_str )
      write(*,*) 'input= trim(str) :', len(str), len_trim(str), len_str 

      call f_utils_strlencrop ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str



!
      write(*,*) 'Test 5: add NL and CR and NULL to trim(str)'

      str = str(1:ls) // ck_char_lf // ck_char_cr // ck_char_nul 

      call f_utils_strlentrim ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str

      call f_utils_strlentrim ( trim(str), len_trim(str), len_str )
      write(*,*) 'input= trim(str) :', len(str), len_trim(str), len_str 

      call f_utils_strlencrop ( str, maxlen, len_str )
      write(*,*) 'input= str       :', len(str), len_trim(str), len_str














      stop 
      end program 
