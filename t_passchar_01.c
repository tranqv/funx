    #include <stdio.h>
    #include <string.h>
     
    void explicitly_by_pointer( char *str );
    void secretly_by_pointer( char str[] );
    void secretly_by_pointer_again( char str[32] );
    void by_pointer_to_array_of_specific_size( char ( *str )[32] );
     
    int main()
    {
        char test[32];
        char other[10];
     
        strcpy( test, "test" );
        strcpy( other, "other" );
     
        puts( "On main:\n" );
        // actually able to get capacity
        printf( " sizeof(test) = %lu\n", sizeof( test ) );
        printf( "sizeof(*test) = %lu\n", sizeof( *test ) );
        puts( "-----" );
        // actually able to get capacity
        printf( " sizeof(other) = %lu\n", sizeof( other ) );
        printf( "sizeof(*other) = %lu\n", sizeof( *other ) );
     
        puts( "\n========================================" );
     
        explicitly_by_pointer( test );
        secretly_by_pointer( test );
        secretly_by_pointer_again( test );
        by_pointer_to_array_of_specific_size( &test );
     
        puts( "\n========================================" );
     
        explicitly_by_pointer( other );
        secretly_by_pointer( other );
        secretly_by_pointer_again( other );
        by_pointer_to_array_of_specific_size( &other );
     
        return 0;
    }
     
    void explicitly_by_pointer( char *str )
    {
        puts( "\nOn explicitly_by_pointer:" );
        printf( "str = [%s]\n", str );
        printf( " sizeof(str) = %lu\n", sizeof( str ) );
        printf( "sizeof(*str) = %lu\n", sizeof( *str ) );
    }
     
    void secretly_by_pointer( char str[] )
    {
        puts( "\nOn secretly_by_pointer:" );
        printf( "str = [%s]\n", str );
        printf( " sizeof(str) = %lu\n", sizeof( str ) );
        printf( "sizeof(*str) = %lu\n", sizeof( *str ) );
    }
     
    void secretly_by_pointer_again( char str[32] )
    {
        puts( "\nOn secretly_by_pointer_again:" );
        printf( "str = [%s]\n", str );
        printf( " sizeof(str) = %lu\n", sizeof( str ) );
        printf( "sizeof(*str) = %lu\n", sizeof( *str ) );
    }
     
    void by_pointer_to_array_of_specific_size( char ( *str )[32] )
    {
        puts( "\nOn by_pointer_to_array_of_specific_size:" );
        printf( "str = [%s]\n", *str );
        printf( " sizeof(str) = %lu\n", sizeof( str ) );
        // actually able to get capacity as specified by parameter type
        printf( "sizeof(*str) = %lu\n", sizeof( *str ) );
    }

