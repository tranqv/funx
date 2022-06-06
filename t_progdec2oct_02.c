/* C Program to Convert Decimal to Octal Number */
 
#include <stdio.h>


long Decimal_to_Octal ( int number )
{
    long octalNumber = 0, i = 1;
    int remainder;

    while ( number != 0 )
    {
        remainder = number % 8;
        number = number / 8;
        octalNumber = octalNumber + (remainder * i);
        i = i * 10;
    }
    return octalNumber;
}


int main() 
{
    int number, i, j;
    printf("\n Please Enter the Number You want to Convert  :  ");
    scanf("%d", &number);
    
    long oct  = Decimal_to_Octal(number);
    printf("\n Equivalent Octal Number of %d =  %ld", number, oct);
    
    return 0;
}
