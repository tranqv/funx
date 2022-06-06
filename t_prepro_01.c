
/*
   PREPROCESSOR DEFINITIONS 

   Learn from 
      Peter van der Linden Expert C Programming Deep C Secrets.pdf
      p. 13
*/


#define STRING char *  
#define IF if( 
#define THEN ){ 
#define ELSE } else { 
#define FI ;}  
#define WHILE while ( 
#define DO ){ 
#define OD ;}  
#define INT int  
#define BEGIN { 
#define END }


INT compare(s1, s2)      
   STRING s1;      
   STRING s2;  
BEGIN      
   WHILE *s1++ == *s2      
   DO 
      IF *s2++ == 0          
         THEN return(0);          
      FI      
   OD      
   return(*--s1 - *s2);  
END




/*
The orginal version:

int 
   compare ( s1, s2 )   
   char *s1, *s2; 
{     
   while (*s1++ == *s2) 
   {             
      if (*s2++ == 0) return (0);      
   }      
   return (*--s1 - *s2);  
}
*/
