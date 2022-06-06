      program y01 
!
      implicit none 
!
      integer(kind=1)   i1 
      integer(kind=2)   i2 
      integer(kind=4)   i4 
      integer(kind=8)   i8 
      integer(kind=16)   i16 
!     integer(kind=32)   i32 
!     integer(kind=8)   ix 

!
!
      i1 = -huge(i1) 
      write(*,1) 'i1', i1, huge(i1)  

      i2 = -huge(i2) 
      write(*,1) 'i2', i2, huge(i2)  

      i4 = -huge(i4) 
      write(*,1) 'i4', i4, huge(i4)  

      i8 = -huge(i8) 
      write(*,1) 'i8', i8, huge(i8)  

      i16 = -huge(i16) 
      write(*,1) 'i16', i16, huge(i16)  



1     format(a3,':',1x,i40,i40)

      stop 
      end program 
