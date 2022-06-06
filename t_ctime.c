/*
   C program to demonstrate 
   ctime() function. 
*/

#include <stdio.h> 
#include <time.h> 
  
int main () 
{ 
    time_t curtime ; 
      
    time ( &curtime ) ; 
      
    printf ( "Current time = %d = %s", curtime, ctime(&curtime) ); 
      
    return(0); 
} 

