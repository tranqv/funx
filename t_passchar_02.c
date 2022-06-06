    #include <stdio.h>
    #include <string.h>
     
    void passchar01 ( char ( *str )[32] );
     
    int main()
    {
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
     
        passchar01 ( &test );
     
//      puts( "\n========================================" );
//      passchar01( &other );
     
        return 0;
    }
     
   void passchar01 ( char ( *str )[32] )
   {
      puts( "\nOn passchar01:" );

      printf( "str = [%s]\n", *str );
      printf( " sizeof(str) = %lu\n", sizeof( str ) );

//    actually able to get capacity as specified by parameter type
      printf( "sizeof(*str) = %lu\n", sizeof( *str ) );
    }

