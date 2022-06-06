!
!  ASCII table:
!     Dec      Char
!     ---------
!     0        NUL (null)                         <-- CHAR_00
!     10       CHAR_NL  (NL line feed, new line)  <-- CHAR_CR
!     13       CHAR_CR  (carriage return)         <-- CHAR_NL
!     32       WHITE SPACE                        <-- CHAR_WS
!
      character(len=1), parameter   :: CHAR_00 = char(0) 
      character(len=1), parameter   :: CHAR_CR = char(13)
      character(len=1), parameter   :: CHAR_NL = char(10)
      character(len=1), parameter   :: CHAR_WS = char(32)
!
!
      integer(kind=4), parameter    :: ICHA_00 = 0 
      integer(kind=4), parameter    :: ICHA_CR = 13
      integer(kind=4), parameter    :: ICHA_NL = 10
      integer(kind=4), parameter    :: ICHA_WS = 32
