/* C Program to Convert Decimal to Octal Number */
 
#include <stdio.h>
#include <sys/types.h>
//#include <sys/stat.h>



mode_t Decimal_to_Octal ( mode_t number )
{
   mode_t octalNumber = 0 ;
   int i = 1;
   mode_t remainder ;

   while ( number != 0 )
   {
      remainder = number % 8;
      number = number / 8;
      octalNumber = octalNumber + (remainder*i) ;
      i = i * 10;
   }
   return octalNumber;
}


int main() 
{
   mode_t number ;
   int i, j ;
   printf ("\n Please Enter the Number You want to Convert  :  ");
   scanf ("%d", &number);
    
   mode_t oct  = Decimal_to_Octal(number);
   printf("\n Equivalent Octal Number of %d =  %ld", number, oct);
    
   return 0;
}
