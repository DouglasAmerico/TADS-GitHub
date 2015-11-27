#include <stdio.h>
#include <conio.h>
#include<stdlib.h>

main()
{
    int a=1,b=1,resp=0;
    for (b=1;b<50;b++)
    {
        resp= resp + (a/b);
        a= a + 2;
    }
   printf ("Total %d\n",resp);
   getch  ();
}

