#include <stdio.h>
#include <time.h>

int main(void)
{
    time_t rawtime = 1262304000;
    struct tm  ts;
    char       buf[80];

    // Format time, "ddd yyyy-mm-dd hh:mm:ss zzz"
    ts = *localtime(&rawtime);
    strftime(buf, sizeof(buf), "%a %Y-%m-%d %H:%M:%S %Z", &ts);
    printf("%s\n", buf);
    return 0;
}
/*
	Output: 

Fri 2010-01-01 07:00:00 +07
*/
