   #include <stdio.h>
   #include <string.h>
     
   void passchar01 ( int *, char [] );
   void passchar02 ( char * );
     
   int main()
   {
      int l ; 
      l = 20 ;

      char test[32];
      char other[10];
     
      strcpy( test, "test" );
      strcpy( other, "other" );
   
      puts( "On main:\n" );

      // actually able to get capacity
      printf( " sizeof(%s) = %lu\n", test, sizeof( test ) );
      printf( "sizeof(*%s) = %lu\n", test, sizeof( *test ) );

      puts( "-----" );

      // actually able to get capacity
      printf( " sizeof(%s) = %lu\n", other, sizeof( other ) );
      printf( "sizeof(*%s) = %lu\n", other, sizeof( *other ) );
   
      puts( "\n========================================" );
   
      passchar01 ( &l, &test[0] );
      passchar02 ( test );
   
      puts( "\n========================================" );

      passchar01 ( &l, &other[0] );
      passchar02 ( other );

   
      return 0;
   }
///     
   void passchar01 ( int *l, char str[] )
   {
      puts( "\nOn passchar01:" );

      printf( "str = [%s]\n", str );
      printf( " sizeof(%s) = %lu\n", str, sizeof( str[0] ) );

//    actually able to get capacity as specified by parameter type
      printf( "sizeof(*%s) = %lu\n", str, sizeof( *str ) );
   }
///     
   void passchar02 ( char *str )
   {
      puts( "\nOn passchar02:" );

      printf( "str = [%s]\n", str );
      printf( " sizeof(%s) = %lu\n", str, sizeof( str ) );

//    actually able to get capacity as specified by parameter type
      printf( "sizeof(*%s) = %lu\n", str, sizeof( *str ) );
   }

